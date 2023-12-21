//
//  NewsListView.swift
//  Daily Journal App
//
//  Created by Natia Khizanishvili on 21.12.23.
//

import SwiftUI

struct NewsListView: View {
    @Binding var newsList: [News]

    var body: some View {
        VStack {
            if newsList.isEmpty {
                Text("No news added yet.")
                    .foregroundColor(.gray)
                    .padding()
                Spacer()
            } else {
                List {
                    ForEach(newsList, id: \.id) { news in
                        NavigationLink(destination: NewsDetailView(news: news)) {
                            NewsRow(news: news)
                        }
                    }
                    .onDelete(perform: deleteNews)
                    .onMove(perform: moveNews)
                }
                .listStyle(PlainListStyle())
                .navigationBarItems(trailing: EditButton())
            }
        }
        .navigationTitle("News")
    }

    func deleteNews(at offsets: IndexSet) {
        newsList.remove(atOffsets: offsets)
    }

    func moveNews(from source: IndexSet, to destination: Int) {
        newsList.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    NewsListView(newsList: .constant([]))
}

