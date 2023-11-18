//
//  MovieDetailsViewController.swift
//  MovieDB
//
//  Created by Natia Khizanishvili on 11.11.23.
//

import UIKit

class MovieDetailsViewController: UIViewController {

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
        imageView.heightAnchor.constraint(equalToConstant: 200).isActive = true
        return imageView
    }()

    // MARK: Properties
    private let viewModel: MovieDetailsViewModel

    init(viewModel: MovieDetailsViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        viewModel.viewDidLoad()
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
        ])
    }

    // MARK: - Internal Functions
    func configure(with movie: Movie) {
        titleLabel.text = movie.title
        yearLabel.text = "Year: \(movie.year)"
        typeLabel.text = "Type: \(movie.type)"
    }

    func setPosterImage(_ image: UIImage) {
        posterImageView.image = image
    }

    func setDefaultPosterImage() {
        posterImageView.image = UIImage(named: "placeholder")
    }
}
