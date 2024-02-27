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

    /// Returns true if the expression contains both a priority operand (* or /) and a normal operand (+ or -)
    private func getIsExpressionContainingComplexCalc(_ expression: [String]) -> Bool {
        let result = (expression.contains("*") || expression.contains("/")) &&
        (expression.contains("+") || expression.contains("-"))
        return result
    }

    private var isExpressionContainingComplexCalc = false

    /// Returns the result of the full expression in parameter, check if there is any priority operand,
    /// if yes, then calculates it before calling the calculate method when no priority operand is detected
    func calculateExpression(expression: [String]) throws -> String {
        var operationsToReduce = expression
        isExpressionContainingComplexCalc = getIsExpressionContainingComplexCalc(expression)
        if isExpressionContainingComplexCalc {
            while isExpressionContainingComplexCalc {
                let index: Int! = operationsToReduce.firstIndex { $0 == "*" || $0 == "/"}
                let result = try calculate(
                        expression: [
                            operationsToReduce[index - 1],
                            operationsToReduce[index],
                            operationsToReduce[index + 1]
                        ])

                operationsToReduce.remove(at: index - 1)
                operationsToReduce.remove(at: index - 1)
                operationsToReduce.remove(at: index - 1)
                operationsToReduce.insert(result, at: index - 1)
                isExpressionContainingComplexCalc = getIsExpressionContainingComplexCalc(operationsToReduce)
            }

                return try calculate(expression: operationsToReduce)

        }

            return try calculate(expression: operationsToReduce)

    }

/// Returns the result of the full expression passed in parameter
    private func calculate(expression: [String]) throws -> String {
        // Create local copy of operations
        var operationsToReduce = expression
        // Iterate over operations while an operand still here
        while operationsToReduce.count > 1 {
            let left = Float(operationsToReduce[0])!
            let operand = operationsToReduce[1]
            let right = Float(operationsToReduce[2])!

            let result: String
            switch operand {
            case "+": result = add(left, with: right)
            case "-": result = substract(left, with: right)
            case "*": result = multiply(left, with: right)
            case "/": result = divide(left, with: right)
            default: throw Errors.invalidOperatorError
            }

            if result == "err" {
                return "err"
            }

            operationsToReduce = Array(operationsToReduce.dropFirst(3))
            operationsToReduce.insert(result, at: 0)
        }

        return operationsToReduce.first!
    }

    /// Returns the result of the addition of the two Floats in parameter
    private func add(_ first: Float, with second: Float) -> String {
        return "\(first + second)"
    }

    /// Returns the result of the substraction of the two Floats in parameter
    private func substract(_ first: Float, with second: Float) -> String {
        return "\(first - second)"
    }

    /// Returns the result of the multiplication of the two Floats in parameter
    private func multiply(_ first: Float, with second: Float) -> String {
        return "\(first * second)"
    }

    /// Returns the result of the division of the two Floats in parameter, if one of them is equal to 0, returns err
    private func divide(_ first: Float, with second: Float) -> String {
        if first == 0 || second == 0 {
            return "err"
        }
        return "\(first / second)"
    }
}

enum Errors: Error {
    case invalidOperatorError
}
