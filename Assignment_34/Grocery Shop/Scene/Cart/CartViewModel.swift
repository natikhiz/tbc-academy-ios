//
//  CartViewModel.swift
//  Grocery Shop
//
//  Created by Natia Khizanishvili on 11.12.23.
//

import Foundation
import SwiftUI
import Combine

class CartViewModel: ObservableObject {
    @Published var cartItems: [CartItem] = []

    @Published var cartTotalCost: Double = 0

    init() {
        $cartItems
            .map { $0.reduce(0) { $0 + $1.product.price * Double($1.count) } }
            .assign(to: &$cartTotalCost)
    }

    func addItemToCart(_ product: Product, count: Int) {
        if let existingItemIndex = cartItems.firstIndex(where: { $0.product.id == product.id }) {
            cartItems[existingItemIndex].count += count
        } else {
            cartItems.append(CartItem(product: product, count: count))
        }
    }

    func removeItemFromCart(_ item: CartItem) {
        if let index = cartItems.firstIndex(where: { $0.id == item.id }) {
            cartItems.remove(at: index)
        }
    }

    func clearCart() {
        cartItems.removeAll()
    }
}
