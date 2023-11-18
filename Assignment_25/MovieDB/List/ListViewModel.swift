//
//  ListViewModel.swift
//  MovieDB
//
//  Created by Natia Khizanishvili on 18.11.23.
//

import Foundation

class ListViewModel {

    private weak var viewController: ListViewController?
    var movies: [Movie] = []

    private let apiKey = "1deb9e95"
    private let baseURLString = "https://www.omdbapi.com/"

    init(viewController: ListViewController) {
        self.viewController = viewController
    }

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

    func fetchMovies(containing searchQuery: String) {
        fetchMovies(searchQuery: searchQuery) { fetchedMovies in
            if let fetchedMovies = fetchedMovies {
                self.movies = fetchedMovies
                self.viewController?.refresh()
            } else {
                DispatchQueue.main.async {
                    self.viewController?.showPopup(with: "Failed to fetch movies.")
                }
            }
        }
    }
}
