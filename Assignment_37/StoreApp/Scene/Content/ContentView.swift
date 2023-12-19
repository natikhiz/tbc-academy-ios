//
//  ContentView.swift
//  StoreApp
//
//  Created by Natia Khizanishvili on 19.12.23.
//

import SwiftUI

struct ContentView: View {
    @State var balance = Balance(amount: 1999)
    @State var cart = Cart()

    var body: some View {
        NavigationStack {
            TabView {
                MainView(category: nil)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Main")
                    }
                    .navigationTitle("NavTat")

                CategoriesView()
                    .tabItem {
                        Image(systemName: "rectangle.stack.fill")
                        Text("Categories")
                    }
            }
        }
        .environmentObject(balance)
        .environmentObject(cart)
    }
}


#Preview {
    ContentView()
}
