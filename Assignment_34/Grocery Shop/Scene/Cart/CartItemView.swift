//
//  CartItemView.swift
//  Grocery Shop
//
//  Created by Natia Khizanishvili on 11.12.23.
//

import SwiftUI

struct CartItemView: View {
    let item: CartItem
    let removeAction: () -> Void

    var body: some View {
        HStack {
            AsyncImage(
                url: URL(string: item.product.imageUrls[0]),
                content: { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 72, height: 56)
                        .clipped()
                        .cornerRadius(12)
                },
                placeholder: {
                    ProgressView()
                }
            )

            VStack(alignment: .leading, spacing: 4) {
                Text(item.product.name)
                    .font(.headline)
                Text("Price: $\(item.product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
                Text("Count: \(item.count)")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Button(action: removeAction) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
            .padding()
        }
        .padding(8)
        .background(Color.secondary.opacity(0.1))
        .cornerRadius(12)
        .padding(.vertical, 4)
    }
}
