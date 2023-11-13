//
//  MovieViewController.swift
//  MovieDB
//
//  Created by Natia Khizanishvili on 11.11.23.
//

import UIKit

class MovieViewController: UIViewController {

    // MARK: UI
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let yearLabel = UILabel()

    private let typeLabel = UILabel()

    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    // MARK: Properties
    var movie: Movie?

    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        configure(with: movie)
    }

    private func setupUI() {
        title = "Movie Details"
        view.backgroundColor = .white

        let stackView = UIStackView(arrangedSubviews: [
            posterImageView, titleLabel, yearLabel, typeLabel, UIStackView()
        ])
        stackView.axis = .vertical
        stackView.spacing = 32
        stackView.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stackView)

        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -16),

            posterImageView.heightAnchor.constraint(equalToConstant: 200)
        ])
    }

    private func configure(with movie: Movie?) {
        guard let movie else { return }

        titleLabel.text = movie.title
        yearLabel.text = "Year: \(movie.year)"
        typeLabel.text = "Type: \(movie.type)"

        DispatchQueue.global().async {
            if let posterURL = URL(string: movie.poster), let data = try? Data(contentsOf: posterURL), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.posterImageView.image = image
                }
            } else {
                DispatchQueue.main.async {
                    self.posterImageView.image = UIImage(named: "placeholder")
                }
            }
        }
    }
}
