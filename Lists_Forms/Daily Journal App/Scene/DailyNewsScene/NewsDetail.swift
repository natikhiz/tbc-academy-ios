//
//  NewsDetail.swift
//  Daily Journal App
//
//  Created by Natia Khizanishvili on 21.12.23.
//

import SwiftUI

struct NewsDetailView: View {
    let news: News

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text(news.description)
                .multilineTextAlignment(.leading)
                .font(.body)
                .padding(.bottom, 8)

            Text("Date: \(formattedDate())")
                .multilineTextAlignment(.leading)
                .font(.caption)
                .foregroundColor(.gray)

            Spacer()
        }
        .padding()
        .navigationBarTitle(news.title)
    }

    func formattedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter.string(from: news.date)
    }
}

#Preview {
    NewsDetailView(
        news: News(
            title: "Example Title",
            description: "Example Description",
            date: Date()
        )
    )
}
