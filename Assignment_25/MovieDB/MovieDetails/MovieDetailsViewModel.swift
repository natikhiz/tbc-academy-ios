//
//  MovieDetailsViewModel.swift
//  MovieDB
//
//  Created by Natia Khizanishvili on 18.11.23.
//

import Foundation
import UIKit

class MovieDetailsViewModel {
    weak var viewController: MovieDetailsViewController?

    let movie: Movie

    init(movie: Movie) {
        self.movie = movie
    }

    func viewDidLoad() {
        configure()
    }

    private func configure() {
        viewController?.configure(with: movie)

        DispatchQueue.global().async {
            if let posterURL = URL(string: self.movie.poster),
               let data = try? Data(contentsOf: posterURL),
               let image = UIImage(data: data)
            {
                DispatchQueue.main.async {
                    self.viewController?.setPosterImage(image)
                }
            } else {
                DispatchQueue.main.async {
                    self.viewController?.setDefaultPosterImage()
                }
            }
        }
    }
}
