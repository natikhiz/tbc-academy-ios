//
//  CategoriesViewModel.swift
//  StoreApp
//
//  Created by Natia Khizanishvili on 19.12.23.
//

import Foundation

class CategoriesViewModel: ObservableObject {
    @Published var categories: [String] = []

    func fetchCategories() {
        NetworkManager.shared.getCategories { result in
            switch result {
            case .success(let categories):
                DispatchQueue.main.async { [weak self] in
                    self?.categories = categories
                }
            case .failure(_):
                print("Fail to fetch categories")
            }
        }
    }
}
