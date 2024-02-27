//
//  CalcManagerTests.swift
//  CountOnMeTests
//
//  Created by Hugo Blas on 08/02/2024.
//  Copyright © 2024 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

// swiftlint:disable force_try

final class CalcManagerTests: XCTestCase {

    let calcManager = CalcManager()

    func testGivenDivisionByZero_WhenRun_ThenReturnZero() {
        let result = try! calcManager.calculateExpression(expression: ["4", "/", "0"])

        XCTAssertEqual(result, "err")
    }

    func testGivenOnePlusOneCalc_WhenAdded_ThenReturnTwo() {
        let result = try! calcManager.calculateExpression(expression: ["1", "+", "1"])

        XCTAssertEqual(result, "2.0")
    }

    func testGivenTwoMinusOneCalc_WhenSubstracted_ThenReturnOne() {
        let result = try! calcManager.calculateExpression(expression: ["2", "-", "1"])

        XCTAssertEqual(result, "1.0")
    }

    func testGivenTwoTimesTwoCalc_WhenMultiplicated_ThenReturnFour() {
        let result = try! calcManager.calculateExpression(expression: ["2", "*", "2"])

        XCTAssertEqual(result, "4.0")
    }

    func testGivenTwoDividedByTwoCalc_WhenDivided_ThenReturnOne() {
        let result = try! calcManager.calculateExpression(expression: ["2", "/", "2"])

        XCTAssertEqual(result, "1.0")
    }

    func testGivenComplexOperation_WhenCalculated_ThenReturnThree() {
        let result = try! calcManager.calculateExpression(expression: ["1", "+", "2", "*", "3", "-", "4"])

        XCTAssertEqual(result, "3.0")
    }

    func testGivenComplexOperation_WhenCalculated_ThenReturnSix() {
        let result = try! calcManager.calculateExpression(
            expression: ["1", "+", "2", "*", "3", "-", "4", "+", "6", "/", "2"])

        XCTAssertEqual(result, "6.0")
    }

    func testGivenWrongOperator_WhenCalculated_ThenThrowsFatalError() {
        XCTAssertThrowsError(try calcManager.calculateExpression(
            expression: ["1", ")", "2", "$", "3", "ù", "4", "'", "6", "`", "2"]), "Invalid Operator", { _ in
                print("error")
            })
    }
}
// swiftlint:enable force_try
