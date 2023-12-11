//
//  ProductViewModel.swift
//  Grocery Shop
//
//  Created by Natia Khizanishvili on 11.12.23.
//

import Foundation
import SwiftUI

class ProductViewModel: ObservableObject {
    @Published var productCount = 0
    private var cartViewModel: CartViewModel

    var product: Product

    init(product: Product, cartViewModel: CartViewModel) {
        self.product = product
        self.cartViewModel = cartViewModel
    }

    func addToCart() {
        cartViewModel.addItemToCart(product, count: productCount)
    }
}
