//
//  ViewController.swift
//  SimpleCalc
//
//  Created by Vincent Saluzzo on 29/03/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var textView: UITextView!
    @IBOutlet private var numberButtons: [UIButton]!

    private let calculationManager = CalcManager()

    private var elements: [String] {
        return textView.text.split(separator: " ").map { "\($0)" }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // Error check computed variables
    private var expressionIsCorrect: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"
    }

    private var expressionHaveEnoughElement: Bool {
        return elements.count >= 3
    }

    var canAddOperator: Bool {
        return elements.last != "+" && elements.last != "-" && elements.last != "*" && elements.last != "/"
    }

    var expressionHaveResult: Bool {
        return textView.text.firstIndex(of: "=") != nil
    }

    // View actions
    @IBAction func tappedNumberButton(_ sender: UIButton) {
        guard let numberText = sender.title(for: .normal) else {
            return
        }

        if expressionHaveResult {
            textView.text = ""
        }

        textView.text.append(numberText)
    }

    @IBAction func tappedAdditionButton(_ sender: UIButton) {
        if canAddOperator {
            textView.text.append(" + ")
        } else {
            let alertVC = UIAlertController(
                title: "Zéro!",
                message: "Un operateur est déja mis !",
                preferredStyle: .alert
            )
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }

    @IBAction func tappedSubstractionButton(_ sender: UIButton) {
        if canAddOperator {
            textView.text.append(" - ")
        } else {
            let alertVC = UIAlertController(
                title: "Zéro!",
                message: "Un operateur est déja mis !",
                preferredStyle: .alert
            )
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }

    @IBAction func tappedMultiplicationButton(_ sender: UIButton) {
        if canAddOperator {
            textView.text.append(" * ")
        } else {
            let alertVC = UIAlertController(
                title: "Zéro!",
                message: "Un operateur est déja mis !",
                preferredStyle: .alert
            )
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }

    @IBAction func tappedDivisionButton(_ sender: UIButton) {
        if canAddOperator {
            textView.text.append(" / ")
        } else {
            let alertVC = UIAlertController(
                title: "Zéro!",
                message: "Un operateur est déja mis !",
                preferredStyle: .alert
            )
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertVC, animated: true, completion: nil)
        }
    }

    @IBAction func tappedACButon(_ sender: UIButton) {
        textView.text = ""
    }

    @IBAction func tappedEqualButton(_ sender: UIButton) {
        guard expressionIsCorrect else {
            let alertVC = UIAlertController(
                title: "Zéro!",
                message: "Entrez une expression correcte !",
                preferredStyle: .alert
            )
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }

        guard expressionHaveEnoughElement else {
            let alertVC = UIAlertController(
                title: "Zéro!",
                message: "Démarrez un nouveau calcul !",
                preferredStyle: .alert
            )
            alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            return self.present(alertVC, animated: true, completion: nil)
        }

        do {
            let result = try calculationManager.calculateExpression(expression: elements)
            textView.text.append(" = \(result)")
        } catch {

        }
    }

}
