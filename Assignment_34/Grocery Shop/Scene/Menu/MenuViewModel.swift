//
//  MenuViewModel.swift
//  Grocery Shop
//
//  Created by Natia Khizanishvili on 11.12.23.
//

import Foundation
import SwiftUI

class MenuViewModel: ObservableObject {
    @Published var products: [Product]

    init(products: [Product]) {
        self.products = products
    }
}
