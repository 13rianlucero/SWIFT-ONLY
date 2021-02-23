//
//  SteakSupplyTests.swift
//  SteakhouseTests
//
//  Created by Paul Inventado on 9/5/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import XCTest
@testable import Steakhouse

class StorageTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitializer() {
        let steakTracker = SteakSupply(numSteaks: 30)
        XCTAssertEqual(steakTracker.numSteaks, 30)
        XCTAssertEqual(steakTracker.message, "")
    }
    
    func testLowSupply1() {
        var steakTracker = SteakSupply(numSteaks: 30)
        steakTracker.numSteaks = 15
        XCTAssertEqual(steakTracker.message, "Steak supply is low. You need to restock.")
    }
    
    func testLowSupply2() {
        var steakTracker = SteakSupply(numSteaks: 30)
        steakTracker.numSteaks = 20
        XCTAssertEqual(steakTracker.message, "")
    }
    
    func testRestock1() {
        var steakTracker = SteakSupply(numSteaks: 10)
        steakTracker.numSteaks = 15
        XCTAssertEqual(steakTracker.message, "Steak supply restocked with 5 steaks.")
    }
    
    func testRestock2() {
        var steakTracker = SteakSupply(numSteaks: 8)
        steakTracker.numSteaks = 27
        XCTAssertEqual(steakTracker.message, "Steak supply restocked with 19 steaks.")

    }


}
