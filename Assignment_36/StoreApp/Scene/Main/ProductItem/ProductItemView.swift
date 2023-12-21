//
//  ProductItemView.swift
//  StoreApp
//
//  Created by Natia Khizanishvili on 19.12.23.
//

import SwiftUI

struct ProductItemView: View {
    let product: Product
    var onAddToCart: () -> Void

    var body: some View {
        VStack {
            Text(product.title)
                .font(.headline)
            Text(productPrice)
                .font(.subheadline)
                .foregroundColor(.green)

            Button(action: {
                onAddToCart()
            }) {
                Text("Add to Cart")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.blue)
                    .cornerRadius(5)
            }

            NavigationLink(destination: ProductDetailView(product: product)) {
                Text("See Details")
                    .font(.footnote)
                    .foregroundColor(.white)
                    .padding(5)
                    .background(Color.blue)
                    .cornerRadius(5)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }

    private var productPrice: String {
        String(format: "$%.2f", Double(product.price))
    }
}
