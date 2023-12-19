//
//  Product.swift
//  StoreApp
//
//  Created by Natia Khizanishvili on 19.12.23.
//

struct Product: Decodable {
    let id: Int
    let title: String
    let description: String
    let price: Int
    let discountPercentage: Double
    let rating: Double
    let stock: Int
    let brand: String
    let category: String
    let thumbnail: String
    let images: [String]
}
