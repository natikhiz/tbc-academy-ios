//
//  CartItem.swift
//  Grocery Shop
//
//  Created by Natia Khizanishvili on 11.12.23.
//

import Foundation

struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var count: Int
}
