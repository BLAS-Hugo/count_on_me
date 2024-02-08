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

    func testGivenOnePlusOneCalc_WhenAdded_ThenReturnTwo() {
        let result = calcManager.calculate(expression: ["1", "+", "1"])

        XCTAssert(result == "2")
    }

    func testGivenTwoMinusOneCalc_WhenSubstracted_ThenReturnOne() {
        let result = calcManager.calculate(expression: ["2", "-", "1"])

        XCTAssert(result == "1")
    }

    func testGivenTwoTimesTwoCalc_WhenMultiplicated_ThenReturnFour() {
        let result = calcManager.calculate(expression: ["2", "*", "2"])

        XCTAssert(result == "4")
    }

    func testGivenTwoDividedByTwoCalc_WhenDivided_ThenReturnOne() {
        let result = calcManager.calculate(expression: ["2", "/", "2"])

        XCTAssert(result == "1")
    }

}
