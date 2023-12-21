//
//  ProductDetailView.swift
//  StoreApp
//
//  Created by Natia Khizanishvili on 19.12.23.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                ImageCarouselView(images: product.images)
                    .frame(height: 200)

                VStack(alignment: .leading, spacing: 8) {
                    Text(product.title)
                        .font(.title)
                        .bold()

                    Text("Description:")
                        .font(.headline)
                        .foregroundColor(.gray)

                    Text(product.description)

                    Text("Price: $\(product.price)")
                        .font(.headline)
                        .foregroundColor(.green)

                    Text("Discount: \(Int(product.discountPercentage))% off")
                        .font(.headline)
                        .foregroundColor(.orange)

                    Text("Rating: \(String(format: "%.1f", product.rating))")
                        .font(.headline)
                        .foregroundColor(.blue)

                    Text("Brand: \(product.brand)")
                        .font(.headline)
                        .foregroundColor(.gray)

                    Text("Stock: \(product.stock) available")
                        .font(.headline)
                        .foregroundColor(product.stock > 0 ? .green : .red)

                    Spacer()
                }
                .padding(16)
            }
        }
        .navigationTitle(product.title)
    }
}

#Preview {
    let sampleProduct = Product(
        id: 1,
        title: "Sample Product",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit.",
        price: 99,
        discountPercentage: 20.0,
        rating: 4.5,
        stock: 10,
        brand: "Sample Brand",
        category: "Electronics",
        thumbnail: "sample_thumbnail",
        images: ["image1", "image2", "image3"]
    )

    return NavigationView {
        ProductDetailView(product: sampleProduct)
    }
}
