//
//  MainViewModel.swift
//  StoreApp
//
//  Created by Natia Khizanishvili on 19.12.23.
//

import SwiftUI

class MainViewModel: ObservableObject {
    @Published var products: [Product] = []

    @Published var balance: Balance = .init(amount: 0)
    @Published var cart = Cart()

    @Published var alertItem: AlertItem?
    @Published var isLoading: Bool = false

    var balanceText: String {
        String(format: "$%.2f", balance.amount)
    }

    var cartItemCount: Int {
        cart.items.count
    }

    var cartTotalPrice: String {
        String(format: "$%.2f", cartTotalPriceToDouble)
    }

    private var cartTotalPriceToDouble: Double {
        Double(
            cart.items
                .map(\.price)
                .reduce(0, +)
        )
    }

    func setBalance(_ balance: Balance) {
        self.balance = balance
    }

    func setCart(_ cart: Cart) {
        self.cart = cart
    }

    func fetchProducts(for category: String?) {
        NetworkManager.shared.getProducts { [weak self] result in
            switch result {
            case .success(let products):
                DispatchQueue.main.async {
                    if let category {
                        self?.products = products.filter { $0.category == category }
                    } else {
                        self?.products = products
                    }
                }
            case .failure(let error):
                self?.showFailureAlert(message: "Error during fetching products: \(error.localizedDescription)")
            }
        }
    }

    func addToCart(_ product: Product) {
        cart.items.append(product)
    }

    func checkout() {
        withAnimation {
            isLoading = true
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.doCheckout()
        }
    }

    private func doCheckout() {

        guard !cart.items.isEmpty else {
            showFailureAlert(message: "Cart should not be empty")
            return
        }

        isLoading = false

        if cartTotalPriceToDouble <= balance.amount {
            self.balance.amount -= cartTotalPriceToDouble
            self.cart.items.removeAll()
            showSuccessAlert()
        } else {
            showFailureAlert(message: "Insufficient funds. Purchase failed.")
        }
    }

    func showSuccessAlert() {
        alertItem = AlertItem(
            title: Text("Success"),
            message: Text("Purchase successful!"),
            dismissButton: .default(Text("OK"))
        )
    }

    func showFailureAlert(message: String = "Insufficient funds. Purchase failed.") {
        alertItem = AlertItem(
            title: Text("Failure"),
            message: Text(message),
            dismissButton: .default(Text("OK"))
        )
    }
}
