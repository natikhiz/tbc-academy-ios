//
//  CategoriesView.swift
//  StoreApp
//
//  Created by Natia Khizanishvili on 19.12.23.
//

import SwiftUI

struct CategoriesView: View {
    @ObservedObject var viewModel = CategoriesViewModel()

    var body: some View {
        List(viewModel.categories, id: \.self) { category in
            NavigationLink(destination: MainView(category: category)) {
                Text(category)
            }
        }
        .onAppear {
            viewModel.fetchCategories()
        }
        .navigationTitle("Categories")
    }
}

#Preview {
    CategoriesView()
}
