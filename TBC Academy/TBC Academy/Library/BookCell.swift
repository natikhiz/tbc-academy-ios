//
//  BookCell.swift
//  Library
//
//  Created by Natia Khizanishvili on 30.10.23.
//

import UIKit

import UIKit

class BookCell: UITableViewCell {

    // MARK: - Properties

    let bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViews()
    }

    // MARK: - View Setup

    private func setupViews() {
        contentView.addSubview(bookImageView)
        contentView.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            bookImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            bookImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            bookImageView.widthAnchor.constraint(equalToConstant: 80),
            bookImageView.heightAnchor.constraint(equalToConstant: 120),
        ])

        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: bookImageView.trailingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            titleLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
        ])
    }
}
