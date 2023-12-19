//
//  NetworkManager.swift
//  StoreApp
//
//  Created by Natia Khizanishvili on 19.12.23.
//

import Foundation

enum NetworkError: Error {
    case wrongURL
    case decoding
}

class NetworkManager {
    static let shared = NetworkManager()

    private init() {}

    func getProducts(completion: @escaping (Result<[Product], NetworkError>) -> Void) {
        guard let url = URL(string: "https://dummyjson.com/products") else {
            completion(.failure(.wrongURL))
            return
        }

        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.decoding))
                return
            }

            do {
                let response = try JSONDecoder().decode(GetProductsResponse.self, from: data)
                completion(.success(response.products))
            } catch {
                print("Error decoding products: \(error)")
                completion(.failure(.decoding))
            }
        }

        task.resume()
    }

    func getCategories(completion: @escaping (Result<[String], NetworkError>) -> Void) {
        getProducts { result in
            switch result {
            case .success(let products):
                let categories = products.map(\.category)
                let uniqueCategories = Set(categories)
                let sortedCategories = Array(uniqueCategories).sorted()
                completion(.success(sortedCategories))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
