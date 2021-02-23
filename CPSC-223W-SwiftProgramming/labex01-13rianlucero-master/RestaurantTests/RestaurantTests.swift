//
//  RestaurantTests.swift
//  RestaurantTests
//
//  Created by Paul Inventado on 8/31/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import XCTest
@testable import Restaurant

class RestaurantTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testTip1() {
        XCTAssert(tip(subTotal: 35, tipPercentage: 0.12) == 4.2)
    }
    func testTip2() {
        XCTAssert(tip(subTotal: 10, tipPercentage: 0.15) == 1.5)
    }
    func testTaxes() {
        XCTAssert(taxes(subTotal: 23) == 1.7249999999999999)
    }
    func testTaxes2() {
        XCTAssert(taxes(subTotal: 8) == 0.6)
    }
    func testTotal() {
        XCTAssert(total(subTotal: 18, tipPercentage: 0.10) == 21.150000000000002)
    }

}
