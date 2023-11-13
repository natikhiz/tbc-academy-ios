//
//  ViewController.swift
//  HelloAnimatedWorld
//
//  Created by Natia Khizanishvili on 13.11.23.
//

import UIKit

class ViewController: UIViewController {

    private let label: UILabel = {
        let label = UILabel()
        label.text = "TBC IT Academy"
        label.textColor = .blue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        performAnimations()
    }

    private func setupUI() {
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
        ])
    }

    private func performAnimations() {
        let duration: TimeInterval = 2.5
        let distance: CGFloat = 50

        UIView.animate(withDuration: duration, animations: {
            self.label.frame.origin.y -= distance
            self.label.alpha = 1
        }) { _ in
            UIView.animate(withDuration: duration, animations: {
                self.label.frame.origin.y += distance
                self.label.alpha = 0
            }, completion: { _ in
                self.performAnimations()
            })
        }
    }
}
