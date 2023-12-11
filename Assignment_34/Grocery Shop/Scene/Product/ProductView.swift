//
//  ProductView.swift
//  Grocery Shop
//
//  Created by Natia Khizanishvili on 11.12.23.
//

import SwiftUI

struct ProductView: View {
    @EnvironmentObject private var viewModel: ProductViewModel
    @EnvironmentObject private var cartViewModel: CartViewModel

    var body: some View {
        VStack {

            ImageCarousel(imageNames: viewModel.product.imageUrls)
                .frame(height: 200)


            Text(viewModel.product.name)
                .font(.title)

            HStack {
                Button("-") {
                    if viewModel.productCount > 0 {
                        viewModel.productCount -= 1
                    }
                }
                Text("\(viewModel.productCount)")
                Button("+") {
                    viewModel.productCount += 1
                }
            }

            Text("Price: $\(viewModel.product.price, specifier: "%.2f")")
            Text("Total: $\(viewModel.product.price * Double(viewModel.productCount), specifier: "%.2f")")


            Button("Add to Cart") {
                viewModel.addToCart()
            }
            .disabled(viewModel.productCount == 0)
            .padding()
        }
        .padding()
        .navigationTitle(viewModel.product.name)
    }
}


#Preview {
    ProductView()
}
