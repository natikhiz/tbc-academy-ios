//
//  MainView.swift
//  StoreApp
//
//  Created by Natia Khizanishvili on 19.12.23.
//

import SwiftUI

struct MainView: View {
    var category: String?
    @EnvironmentObject var balance: Balance

    @EnvironmentObject var cart: Cart

    @ObservedObject private var viewModel = MainViewModel()

    var body: some View {
        VStack {
            balanceView

            cartInfoView

            productGridView

            checkoutButton
        }
        .alert(item: $viewModel.alertItem) { alertItem in
            Alert(
                title: alertItem.title,
                message: alertItem.message,
                dismissButton: alertItem.dismissButton
            )
        }
        .onAppear {
            viewModel.setBalance(balance)
            viewModel.setCart(cart)
            viewModel.fetchProducts(for: category)
        }
    }

    // Balance View
    private var balanceView: some View {
        VStack {
            Text("Balance:")
                .font(.headline)
            Text(viewModel.balanceText)
                .font(.title)
                .foregroundColor(.green)
        }
        .padding()
    }

    private var cartInfoView: some View {
        HStack {
            Spacer()
            VStack {
                Text("Items in Cart:")
                    .font(.headline)
                Text("\(viewModel.cartItemCount)")
                    .font(.title)
                    .foregroundColor(.blue)
            }
            Spacer()
            VStack {
                Text("Total Price:")
                    .font(.headline)
                Text(viewModel.cartTotalPrice)
                    .font(.title)
                    .foregroundColor(.blue)
            }
            Spacer()
        }
        .padding()
    }

    private var productGridView: some View {
        ScrollView {
            LazyVGrid(columns: Array(repeating: GridItem(), count: 2), spacing: 16) {
                ForEach(viewModel.products, id: \.id) { product in
                    ProductItemView(product: product, onAddToCart: { viewModel.addToCart(product) })
                }
            }
            .padding()
        }
    }

    private var checkoutButton: some View {
        Button(action: viewModel.checkout) {
            Text("Checkout")
                .font(.headline)
                .foregroundColor(viewModel.isLoading ? .blue : .white)
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .padding(.horizontal, 16)
                .background(Color.blue)
                .cornerRadius(10)
        }
        .padding()
        .disabled(viewModel.isLoading)
        .overlay(viewModel.isLoading ? ProgressView() : nil)
    }
}

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let dismissButton: Alert.Button
}

#Preview {
    MainView()
}
