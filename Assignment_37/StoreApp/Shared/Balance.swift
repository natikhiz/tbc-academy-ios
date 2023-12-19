//
//  Balance.swift
//  StoreApp
//
//  Created by Natia Khizanishvili on 19.12.23.
//

import SwiftUI

final class Balance: ObservableObject {
    var amount: Double

    init(amount: Double) {
        self.amount = amount
    }
}
