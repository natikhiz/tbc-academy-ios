//
//  CreateNewsView.swift
//  Daily Journal App
//
//  Created by Natia Khizanishvili on 21.12.23.
//

import SwiftUI

struct CreateNewsView: View {
    @State private var title = ""
    @State private var description = ""
    @State private var selectedDate = Date()

    let didSaveNews: (News) -> ()

    var body: some View {
        VStack {
            TextField("Enter Title", text: $title)
                .textFieldStyle(RoundedBorderTextFieldStyle())

            TextEditor(text: $description)
                .border(Color.gray, width: 1)
                .frame(height: 150)

            DatePicker("Select Date", selection: $selectedDate, displayedComponents: .date)

            Button(action: saveNews) {
                Text("Save News")
                    .padding()
                    .foregroundColor(.white)
                    .background(Color.blue)
                    .cornerRadius(8.0)
            }
        }
        .padding()
    }

    func saveNews() {
        let news = News(title: title, description: description, date: selectedDate)
        didSaveNews(news)

        reset()
    }

    private func reset() {
        title = ""
        description = ""
        selectedDate = Date()
    }
}

#Preview {
    CreateNewsView(didSaveNews: { _ in })
}
