//
//  CalcManager.swift
//  CountOnMe
//
//  Created by Hugo Blas on 08/02/2024.
//  Copyright © 2024 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalcManager {

    init() {
        
    }

    func calculate(expression: [String]) -> String {
        // Create local copy of operations
        var operationsToReduce = expression
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Int(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Int(operationsToReduce[2])!

            let result: Int
            switch operand {
            case "+": result = add(left, with: right)
            case "-": result = substract(left, with: right)
            case "*": result = multiply(left, with: right)
            case "/": result = divide(left, with: right)
            default: fatalError("Unknown operator !")
            }

            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }

        return operationsToReduce.first!
    }

    private func add(_ first: Int, with second: Int) -> Int {
        return first + second
    }

    private func substract(_ first: Int, with second: Int) -> Int {
        return first - second
    }

    private func multiply(_ first: Int, with second: Int) -> Int {
        return first * second
    }

    private func divide(_ first: Int, with second: Int) -> Int {
        return first / second
    }
}
