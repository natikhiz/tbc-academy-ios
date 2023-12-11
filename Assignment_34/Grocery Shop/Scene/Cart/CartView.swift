//
//  Cart.swift
//  Grocery Shop
//
//  Created by Natia Khizanishvili on 11.12.23.
//

import Foundation
import SwiftUI

struct CartView: View {
    @EnvironmentObject private var viewModel: CartViewModel

    var body: some View {
        VStack {
            List {
                ForEach(viewModel.cartItems) { item in
                    CartItemView(item: item, removeAction: { viewModel.removeItemFromCart(item) })
                        .frame(maxHeight: 64)
                }
            }
            .listStyle(PlainListStyle())

            HStack {
                Spacer()
                Text("Total: $\(viewModel.cartTotalCost, specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(.primary)
                Spacer()
            }
            .padding()

            Button("Clear") {
                viewModel.clearCart()
            }
            .padding()
            .background(Color.red)
            .foregroundColor(.white)
            .cornerRadius(8)
            .padding()
        }
        .navigationTitle("Cart")
    }
}
