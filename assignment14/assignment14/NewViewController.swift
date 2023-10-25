//
//  ViewController.swift
//  Assignment14
//
//  Created by Natia Khizanishvili on 25.10.23.
//

import UIKit

class NewViewController: UIViewController {

    @IBOutlet weak var favouriteButton: UIButton!

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var largeSizeButton: UIButton!
    @IBOutlet weak var mediumSizeButton: UIButton!
    @IBOutlet weak var smallSizeButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var ratingCountLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!

    private let coffee = Coffee(
        title: "Cappunino Gold",
        subtitle: "With gold chocolate",
        ratingUpToFive: 4.9,
        ratingCount: 999,
        description: "Best of the best coffee ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever ever",
        priceForSmall: 2.3,
        priceForMedium: 3.4,
        priceForLarge: 4.5
    )

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.text = coffee.title
        subtitleLabel.text = coffee.subtitle
        ratingLabel.text = "\(coffee.ratingUpToFive)"
        ratingCountLabel.text = "(\(coffee.ratingCount))"
        descriptionLabel.text = coffee.description
    }

    @IBAction func smallDidTap(_ sender: Any) {
        priceLabel.text = "$ \(coffee.priceForSmall)"
    }

    @IBAction func mediumDidTap(_ sender: Any) {
        priceLabel.text = "$ \(coffee.priceForMedium)"
    }

    @IBAction func largeDidTap(_ sender: Any) {
        priceLabel.text = "$ \(coffee.priceForLarge)"
    }
}

