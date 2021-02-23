//
//  SteakhouseTests.swift
//  SteakhouseTests
//
//  Created by Paul Inventado on 9/2/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import XCTest
@testable import Steakhouse

class SteakhouseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSteak() {
        var _ = Steak(uncookedWeight: 8, internalTemperature: 100)
    }
    
    func testSteakInitializers1() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 150)
        XCTAssertEqual(mySteak.uncookedWeight, 10)
        XCTAssertEqual(mySteak.internalTemperature, 150)
    }
    
    func testSteakInitializers2() {
        let mySteak = Steak(uncookedWeight: 30, internalTemperature: 120)
        XCTAssertEqual(mySteak.uncookedWeight, 30)
        XCTAssertEqual(mySteak.internalTemperature, 120)
    }
    
    func testCook1() {
        var mySteak = Steak(uncookedWeight: 10, internalTemperature: 150)
        mySteak.cook()
        XCTAssertEqual(mySteak.internalTemperature, 155)
    }
    func testCook2() {
        var mySteak = Steak(uncookedWeight: 10, internalTemperature: 100)
        mySteak.cook()
        XCTAssertEqual(mySteak.internalTemperature, 105)
    }
    func testUncookedDoneness1() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 100)
        XCTAssertEqual(mySteak.doneness, "Uncooked")
    }
    
    func testUncookedDoneness2() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 0)
        XCTAssertEqual(mySteak.doneness, "Uncooked")
    }
    
    func testUncookedDoneness3() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 124.9999)
        XCTAssertEqual(mySteak.doneness, "Uncooked")
    }
    
    func testRareDoneness1() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 125)
        XCTAssertEqual(mySteak.doneness, "Rare")
    }
    
    func testRareDoneness2() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 128)
        XCTAssertEqual(mySteak.doneness, "Rare")
    }
    
    func testRareDoneness3() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 134.999)
        XCTAssertEqual(mySteak.doneness, "Rare")
    }
    
    func testMediumRareDoneness1() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 135)
        XCTAssertEqual(mySteak.doneness, "Medium rare")
    }
    
    func testMediumRareDoneness2() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 136)
        XCTAssertEqual(mySteak.doneness, "Medium rare")
    }
    
    func testMediumRareDoneness3() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 144.999)
        XCTAssertEqual(mySteak.doneness, "Medium rare")
    }

    func testMediumDoneness1() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 145)
        XCTAssertEqual(mySteak.doneness, "Medium")
    }
    
    func testMediumDoneness2() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 145.2)
        XCTAssertEqual(mySteak.doneness, "Medium")
    }
    
    func testMediumDoneness3() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 149.999)
        XCTAssertEqual(mySteak.doneness, "Medium")
    }
    
    func testMediumWellDoneness1() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 150)
        XCTAssertEqual(mySteak.doneness, "Medium well")
    }
    
    func testMediumWellDoneness2() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 155.9)
        XCTAssertEqual(mySteak.doneness, "Medium well")
    }
    
    func testMediumWellDoneness3() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 159.999)
        XCTAssertEqual(mySteak.doneness, "Medium well")
    }

    func testWellDoneness1() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 160)
        XCTAssertEqual(mySteak.doneness, "Well done")
    }
    
    func testWellDoneness2() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 164.2)
        XCTAssertEqual(mySteak.doneness, "Well done")
    }
    
    func testWellDoneness3() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 169.999)
        XCTAssertEqual(mySteak.doneness, "Well done")
    }
    
    func testBurntness1() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 170)
        XCTAssertEqual(mySteak.doneness, "Burnt")
    }
    
    func testBurntness2() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 200)
        XCTAssertEqual(mySteak.doneness, "Burnt")
    }
    
    func testCookedWeightUncooked() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 100)
        XCTAssertEqual(mySteak.cookedWeight, 10)
    }
    
    func testCookedWeightRare() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 125)
        XCTAssertEqual(mySteak.cookedWeight, 9.5)
    }
    
    func testCookedWeightMediumRare() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 138)
        XCTAssertEqual(mySteak.cookedWeight, 9.0)
    }
    
    func testCookedWeightMedium() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 148)
        XCTAssertEqual(mySteak.cookedWeight, 8.5)
    }
    
    func testCookedWeightMediumWell() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 152)
        XCTAssertEqual(mySteak.cookedWeight, 8.0)
    }
    
    func testCookedWeightWellDone() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 162)
        XCTAssertEqual(mySteak.cookedWeight, 7.5)
    }
    
    func testCookedWeightBurnt() {
        let mySteak = Steak(uncookedWeight: 10, internalTemperature: 200)
        XCTAssertEqual(mySteak.cookedWeight, 7.0)
    }
}
