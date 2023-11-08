//
//  ViewController.swift
//  AsyncCalculator
//
//  Created by Natia Khizanishvili on 08.11.23.
//

import UIKit

class ViewController: UIViewController {

    var winner: String?


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        run()
    }

    private func calculateFactorial(for number: Int) -> Int {
        var factorial = 1
        for i in 1...number {
            factorial *= i
        }
        return factorial
    }

    private func runFactorialThread(for number: Int) {
        DispatchQueue.global().async {
            let factorial = self.calculateFactorial(for: number)
            print("Factorial of \(number) is \(factorial)")

            if self.winner == nil {

                self.winner = Thread.current.name

                print("The winner is \(self.winner!)")
            }


        }
    }

    private func run() {
        let lowerBound = 10
        let upperBound = 20

        let firstRandomNumber = Int.random(in: lowerBound...upperBound)
        let secondRandomNumber = Int.random(in: lowerBound...upperBound)

        runFactorialThread(for: firstRandomNumber)
        runFactorialThread(for: secondRandomNumber)
    }
}

