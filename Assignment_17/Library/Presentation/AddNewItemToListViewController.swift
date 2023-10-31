//
//  AddNewItemToListViewController.swift
//  Library
//
//  Created by Natia Khizanishvili on 30.10.23.
//

import UIKit

protocol AddNewItemToListDelegate: AnyObject {
    func addItemToList(title: String, image: UIImage?)
}

class AddNewItemToListViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    weak var delegate: AddNewItemToListDelegate?
    
    let textField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter item name"
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    let chooseImageButton: UIButton = {
        let button = UIButton()
        button.setTitle("Choose Image", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let chosenImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let saveButton: UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
    }
    
    func setupViews() {
        view.addSubview(textField)
        view.addSubview(chooseImageButton)
        view.addSubview(chosenImageView)
        view.addSubview(saveButton)
        
        // Add constraints for text field
        NSLayoutConstraint.activate([
            textField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            textField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            textField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        // Add constraints for Choose Image button
        NSLayoutConstraint.activate([
            chooseImageButton.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 10),
            chooseImageButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20)
        ])
        chooseImageButton.addTarget(self, action: #selector(chooseImageTapped), for: .touchUpInside)
        
        // Add constraints for chosen image view
        NSLayoutConstraint.activate([
            chosenImageView.topAnchor.constraint(equalTo: chooseImageButton.bottomAnchor, constant: 10),
            chosenImageView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            chosenImageView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            chosenImageView.heightAnchor.constraint(equalToConstant: 200) // Adjust the height as needed
        ])
        
        // Add constraints for Save button
        NSLayoutConstraint.activate([
            saveButton.topAnchor.constraint(equalTo: chosenImageView.bottomAnchor, constant: 10),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
    }
    
    @objc func chooseImageTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true)
    }
    
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]
    ) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            chosenImageView.image = image
        }
        picker.dismiss(animated: true)
    }
    
    @objc func saveTapped() {
        if let item = textField.text {
            delegate?.addItemToList(title: item, image: chosenImageView.image)
        }
        navigationController?.popViewController(animated: true)
    }
}
