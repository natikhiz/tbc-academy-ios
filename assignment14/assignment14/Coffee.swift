//
//  Coffee.swift
//  Assignment14
//
//  Created by Giga Khizanishvili on 26.10.23.
//

import Foundation

struct Coffee {
    let title: String
    let subtitle: String
    let ratingUpToFive: Double
    let ratingCount: Int
    let description: String
    let priceForSmall: Double
    let priceForMedium: Double
    let priceForLarge: Double
}

enum Size {
    case s, m, l
}
