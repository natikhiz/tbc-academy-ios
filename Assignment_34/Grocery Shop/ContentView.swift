//
//  ContentView.swift
//  Grocery Shop
//
//  Created by Natia Khizanishvili on 11.12.23.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @State var menuViewModel = MenuViewModel(products: [.orange, .apple])
    @State var cartViewModel = CartViewModel()
    
    var body: some View {
        NavigationStack {
            TabView {
                MenuView(viewModel: menuViewModel)
                    .navigationTitle("Menu")
                    .tabItem {
                        Label("Menu", systemImage: "list.dash")
                    }
                
                CartView()
                    .navigationTitle("Cart")
                    .tabItem {
                        Label("Cart", systemImage: "cart")
                    }
                
            }
            .environmentObject(cartViewModel)
        }
        
    }
}


#Preview {
    ContentView()
}
