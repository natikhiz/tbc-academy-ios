//
//  Product.swift
//  Grocery Shop
//
//  Created by Natia Khizanishvili on 11.12.23.
//

import Foundation

struct Product {
    let id = UUID()
    let name: String
    let price: Double
    let imageUrls: [String]
}
