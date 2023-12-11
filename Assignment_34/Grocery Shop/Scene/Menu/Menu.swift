//
//  Menu.swift
//  Grocery Shop
//
//  Created by Natia Khizanishvili on 11.12.23.
//

import SwiftUI

struct MenuView: View {
    @StateObject private var viewModel: MenuViewModel
    @EnvironmentObject private var cartViewModel: CartViewModel

    init(viewModel: MenuViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        List(viewModel.products, id: \.id) { product in
            NavigationLink(
                destination: ProductView()
                    .environmentObject(
                        ProductViewModel(product: product, cartViewModel: cartViewModel)
                    )
            ) {
                ProductListCell(product: product)
            }
        }
    }
}


struct ProductListCell: View {
    let product: Product

    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            AsyncImage(
                url: URL(string: product.imageUrls.first!),
                content: { image in
                    image.resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 50, height: 50)
                },
                placeholder: {
                    ProgressView()
                }
            )

            // Title and Price
            VStack(alignment: .leading, spacing: 4) {
                Text(product.name)
                    .font(.headline)
                Text("Price: $\(product.price, specifier: "%.2f")")
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()
        }
        .padding(8)
    }
}
