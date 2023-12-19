//
//  Cart.swift
//  StoreApp
//
//  Created by Natia Khizanishvili on 19.12.23.
//

import SwiftUI

final class Cart: ObservableObject {
    @Published var items: [Product] = []
}
