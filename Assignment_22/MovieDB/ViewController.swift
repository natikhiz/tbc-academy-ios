//
//  ViewController.swift
//  MovieDB
//
//  Created by Natia Khizanishvili on 11.11.23.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    // MARK: UI
    private let searchTextField: UITextField = {
        let searchTextField = UITextField()
        searchTextField.placeholder = "Enter search query"
        searchTextField.borderStyle = .roundedRect
        searchTextField.translatesAutoresizingMaskIntoConstraints = false
        return searchTextField
    }()

    private lazy var searchButton: UIButton = {
        let searchButton = UIButton(type: .system)
        searchButton.setTitle("Search", for: .normal)
        searchButton.addTarget(self, action: #selector(searchButtonTapped), for: .touchUpInside)
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        return searchButton
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [searchTextField, searchButton, tableView])
        stackView.axis = .vertical
        stackView.spacing = 16
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    // MARK: Properties
    private var movies: [Movie] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }

    private func setUp() {
        title = "Movies DB"

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16)
        ])
    }

    private let apiKey = "1deb9e95"
    private let baseURLString = "https://www.omdbapi.com/"

    private func fetchMovies(searchQuery: String, completion: @escaping ([Movie]?) -> Void) {
        guard var components = URLComponents(string: baseURLString) else {
            completion(nil)
            return
        }

        components.queryItems = [
            URLQueryItem(name: "apikey", value: apiKey),
            URLQueryItem(name: "s", value: searchQuery)
        ]

        guard let url = components.url else {
            completion(nil)
            return
        }

        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if error != nil {
                completion(nil)
                return
            }

            guard let httpResponse = response as? HTTPURLResponse,
                  (200..<300).contains(httpResponse.statusCode)
            else {
                completion(nil)
                return
            }

            if let data = data,
               let movies = try? JSONDecoder().decode(MoviesResponse.self, from: data) {
                completion(movies.search)
            } else {
                completion(nil)
            }
        }.resume()
    }

    @objc func searchButtonTapped() {
        guard let searchQuery = searchTextField.text, !searchQuery.isEmpty else {
            // Handle empty search query
            return
        }

        fetchMovies(searchQuery: searchQuery) { fetchedMovies in
            if let fetchedMovies = fetchedMovies {
                self.movies = fetchedMovies
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            } else {
                DispatchQueue.main.async {
                    self.showPopup(with: "Failed to fetch movies.")
                }
            }
        }
    }

    func showPopup(with message: String) {
        let alertController = UIAlertController(
            title: "Error",
            message: message,
            preferredStyle: .alert
        )

        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)

        present(alertController, animated: true, completion: nil)
    }

    // MARK: UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell

        let movie = movies[indexPath.row]

        cell.configure(with: movie)

        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedMovie = movies[indexPath.row]
        let movieViewController = MovieViewController()
        movieViewController.movie = selectedMovie
        navigationController?.pushViewController(movieViewController, animated: true)
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

