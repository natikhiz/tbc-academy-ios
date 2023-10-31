//
//  ItemDetailsViewController.swift
//  Library
//
//  Created by Natia Khizanishvili on 30.10.23.
//

import UIKit

class ItemDetailsViewController: UIViewController {

    var item: Book? // The selected item

    private let bookImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Book Details"
        setupViews()
        displayItemDetails()
    }

    func setupViews() {
        view.addSubview(bookImageView)
        view.addSubview(titleLabel)

        NSLayoutConstraint.activate([
            bookImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            bookImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            bookImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            bookImageView.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.heightAnchor, multiplier: 0.6),

            titleLabel.topAnchor.constraint(equalTo: bookImageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        ])
    }

    func displayItemDetails() {
        guard let item = item else { return }
        bookImageView.image = item.image
        titleLabel.text = item.title
    }
}
