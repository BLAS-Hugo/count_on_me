//
//  CalcManagerTests.swift
//  CountOnMeTests
//
//  Created by Hugo Blas on 08/02/2024.
//  Copyright © 2024 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

final class CalcManagerTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    let calcManager = CalcManager()

    func testGivenDivisionByZero_WhenRun_ThenReturnZero() { // ?
        let result = calcManager.calculateExpression(expression: ["4", "/", "0"])

        XCTAssertEqual(result, "0")
    }

    func testGivenOnePlusOneCalc_WhenAdded_ThenReturnTwo() {
        let result = calcManager.calculateExpression(expression: ["1", "+", "1"])

        XCTAssertEqual(result, "2")
    }

    func testGivenTwoMinusOneCalc_WhenSubstracted_ThenReturnOne() {
        let result = calcManager.calculateExpression(expression: ["2", "-", "1"])

        XCTAssertEqual(result, "1")
    }

    func testGivenTwoTimesTwoCalc_WhenMultiplicated_ThenReturnFour() {
        let result = calcManager.calculateExpression(expression: ["2", "*", "2"])

        XCTAssertEqual(result, "4")
    }

    func testGivenTwoDividedByTwoCalc_WhenDivided_ThenReturnOne() {
        let result = calcManager.calculateExpression(expression: ["2", "/", "2"])

        XCTAssertEqual(result, "1")
    }

    func testComplex() { // rename
        let result = calcManager.calculateExpression(expression: ["1", "+", "2", "*", "3", "-", "4"])

        XCTAssertEqual(result, "3")
    }

    func testComplex2() { // rename
        let result = calcManager.calculateExpression(expression: ["1", "+", "2", "*", "3", "-", "4", "+", "6", "/", "2"])

        XCTAssertEqual(result, "0")
    }

}
