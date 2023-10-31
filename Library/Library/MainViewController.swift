//
//  MainViewController.swift
//  Library
//
//  Created by Natia Khizanishvili on 30.10.23.
//

import UIKit

struct Book {
    let title: String
    let image: UIImage?
}

class MainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, AddNewItemToListDelegate {

    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    var items: [Book] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Book List"
        setupNavigationBar()
        setupTableView()
    }

    func setupNavigationBar() {
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
        navigationItem.rightBarButtonItem = addButton
    }

    @objc func addButtonTapped() {
        let addViewController = AddNewItemToListViewController()
        addViewController.delegate = self
        navigationController?.pushViewController(addViewController, animated: true)
    }

    func setupTableView() {
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self

        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])

        tableView.register(BookCell.self, forCellReuseIdentifier: "bookCell")
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookCell", for: indexPath) as! BookCell
        let item = items[indexPath.row]
        cell.titleLabel.text = item.title
        cell.bookImageView.image = item.image
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150.0
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            let selectedBook = items[indexPath.row]
            let itemDetailsVC = ItemDetailsViewController()
            itemDetailsVC.item = selectedBook

            navigationController?.pushViewController(itemDetailsVC, animated: true)
        }

    func addItemToList(title: String, image: UIImage?) {
        let newItem = Book(title: title, image: image)
        items.append(newItem)
        tableView.reloadData()
    }
}

