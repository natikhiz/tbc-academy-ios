//
//  ImageCarouselView.swift
//  StoreApp
//
//  Created by Natia Khizanishvili on 19.12.23.
//

import SwiftUI

struct ImageCarouselView: View {
    var images: [String]

    var body: some View {
        TabView {
            ForEach(images, id: \.self) { imageName in
                AsyncImage(url: URL(string: imageName)) { phase in
                    switch phase {
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    case .failure:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    case .empty:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    @unknown default:
                        Image(systemName: "photo")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}

struct ImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleImages = [
            "https://example.com/image1.jpg",
            "https://example.com/image2.jpg",
            "https://example.com/image3.jpg",
        ]

        ImageCarouselView(images: sampleImages)
            .frame(height: 200)
            .previewLayout(.sizeThatFits)
            .background(Color.gray)
    }
}
