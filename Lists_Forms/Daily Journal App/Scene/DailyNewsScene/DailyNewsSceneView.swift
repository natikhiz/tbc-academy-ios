//
//  DailyNewsSceneView.swift
//  Daily Journal App
//
//  Created by Natia Khizanishvili on 21.12.23.
//

import SwiftUI

struct DailyNewsSceneView: View {
    @State private var newsList: [News] = []

    var body: some View {
        VStack {
            CreateNewsView(didSaveNews: { newNews in
                newsList.append(newNews)
            })

            NewsListView(newsList: $newsList)
                .navigationBarTitle("Daily News")
        }
    }
}

#Preview {
    DailyNewsSceneView()
}
