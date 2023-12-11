//
//  ImageCarousel.swift
//  Grocery Shop
//
//  Created by Natia Khizanishvili on 11.12.23.
//

import SwiftUI

struct ImageCarousel: View {
    let imageNames: [String]

    var body: some View {
        TabView {
            ForEach(imageNames, id: \.self) { imageName in
                AsyncImage(
                    url: URL(string: imageName),
                    content: { image in
                        image.resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 200)
                            .clipped()
                            .cornerRadius(12)
                    },
                    placeholder: {
                        ProgressView()
                    }
                )
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}
