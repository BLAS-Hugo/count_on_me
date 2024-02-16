//
//  CalcManager.swift
//  CountOnMe
//
//  Created by Hugo Blas on 08/02/2024.
//  Copyright © 2024 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalcManager {

    init() { }

    private func getIsExpressionContainingComplexCalc(_ expression: [String]) -> Bool {
        let result = (expression.contains("*") || expression.contains("/")) &&
        (expression.contains("+") || expression.contains("-"))
        return result
    }

    private var isExpressionContainingComplexCalc = false

    func calculateExpression(expression: [String]) throws -> String {
        var operationsToReduce = expression
        isExpressionContainingComplexCalc = getIsExpressionContainingComplexCalc(expression)
        if isExpressionContainingComplexCalc {
            while isExpressionContainingComplexCalc {
                let index: Int! = operationsToReduce.firstIndex { $0 == "*" || $0 == "/"}
                let result =  try calculate(
                        expression: [
                            operationsToReduce[index - 1],
                            operationsToReduce[index],
                            operationsToReduce[index + 1]
                        ])

                operationsToReduce.remove(at: index - 1)
                operationsToReduce.remove(at: index - 1) // Factoriser
                operationsToReduce.remove(at: index - 1)
                operationsToReduce.insert(result, at: index - 1)
                isExpressionContainingComplexCalc = getIsExpressionContainingComplexCalc(operationsToReduce)
            }

                return  try calculate(expression: operationsToReduce)

        }

            return  try calculate(expression: operationsToReduce)

    }

    private func calculate(expression: [String]) throws -> String {
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
            default: throw Errors.invalidOperatorError
            }

            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert("\(result)", at: 0)
        }

        print(operationsToReduce)
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
        if first == 0 || second == 0 {
            return 0 // return err
        }
        return first / second
    }
}

enum Errors: Error {
    case invalidOperatorError
}
