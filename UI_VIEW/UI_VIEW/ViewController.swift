//
//  ViewController.swift
//  UI_VIEW
//
//  Created by Natia Khizanishvili on 23.10.23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var modeSwitch: UISwitch!
    @IBOutlet weak var firstNumberTextField: UITextField!
    @IBOutlet weak var secondNumberTextField: UITextField!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func switchValueDidChange(_ sender: Any) {
        let isLCM = modeSwitch.isOn
        
        if isLCM {
            titleLabel.text = "Least Common Multiple"
        } else {
            titleLabel.text = "Greatest Common Divisor"
        }
    }
    
    @IBAction func calculateButtonDidTap(_ sender: UIButton) {
        guard let firstNumberText = firstNumberTextField.text,
              let firstNumber = Int(firstNumberText) 
        else {
            firstNumberTextField.textColor = .red
            print("Wrong first number")
            return
        }
        
        firstNumberTextField.textColor = .black
        
        guard let secondNumberText = secondNumberTextField.text,
              let secondNumber = Int(secondNumberText)
        else {
            secondNumberTextField.textColor = .red
            print("Wrong second number")
            return
        }
        
        secondNumberTextField.textColor = .black
        
        let isLCM = modeSwitch.isOn
        
        if isLCM {
            resultLabel.text = getLCM(firstNumber, secondNumber).stringValue
        } else {
            resultLabel.text = getGCD(firstNumber, secondNumber).stringValue
        }
    }
    
    private func getGCD(_ a: Int, _ b: Int) -> Int {
        let r = a % b
        
        if r != 0 {
            return getGCD(b, r)
        } else {
            return b
        }
    }
    
    private func getLCM(_ a: Int, _ b: Int) -> Int {
        return a * b / getGCD(a, b)
    }
}

extension Int {
    var stringValue: String {
        "\(self)"
    }
}
