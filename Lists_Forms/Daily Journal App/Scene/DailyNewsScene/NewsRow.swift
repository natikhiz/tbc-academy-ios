//
//  NewsRow.swift
//  Daily Journal App
//
//  Created by Natia Khizanishvili on 21.12.23.
//

import SwiftUI

struct NewsRow: View {
    let news: News

    var body: some View {
        VStack(alignment: .leading) {
            Text(news.title)
                .font(.headline)

            Text(news.description)
                .foregroundColor(.gray)
                .lineLimit(2)

            Text("Date: \(formattedDate())")
                .font(.caption)
                .foregroundColor(.gray)
        }
    }

    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: news.date)
    }
}

#Preview {
    NewsRow(
        news: News(
            title: "My Title",
            description: "My Description",
            date: Date()
        )
    )
}
