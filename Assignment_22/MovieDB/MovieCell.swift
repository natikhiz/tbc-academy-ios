//
//  MovieCell.swift
//  MovieDB
//
//  Created by Natia Khizanishvili on 11.11.23.
//

import UIKit

class MovieCell: UITableViewCell {
    private let posterImageView: UIImageView = {
        let posterImageView = UIImageView()
        posterImageView.contentMode = .scaleAspectFit
        return posterImageView
    }()

    private let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = UIFont.boldSystemFont(ofSize: 16)
        return titleLabel
    }()

    private let yearLabel = UILabel()

    private let typeLabel = UILabel()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, yearLabel, typeLabel])
        stackView.axis = .vertical
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false

        let mainStackView = UIStackView(arrangedSubviews: [stackView, posterImageView])
        mainStackView.alignment = .center
        mainStackView.spacing = 16
        mainStackView.translatesAutoresizingMaskIntoConstraints = false

        return mainStackView
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }

    func setupUI() {
        contentView.addSubview(stackView)

        NSLayoutConstraint.activate([
            posterImageView.widthAnchor.constraint(equalToConstant: 50),
            posterImageView.heightAnchor.constraint(equalToConstant: 70),

            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8)
        ])
    }

    func configure(with movie: Movie) {
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
