//
//  VendingMachineTests.swift
//  VendingMachineTests
//
//  Created by Paul Inventado on 11/18/20.
//

import XCTest
@testable import VendingMachine

class VendingMachineTests: XCTestCase {

    func testInit() {
        let vendo = VendingMachine()
        XCTAssertEqual(vendo.coinsDeposited, 0)
        XCTAssertNotNil(vendo.inventory["Candy Bar"])
        XCTAssertNotNil(vendo.inventory["Chips"])
        XCTAssertNotNil(vendo.inventory["Pretzels"])
        
        XCTAssertEqual(vendo.inventory["Candy Bar"]!.price, 12)
        XCTAssertEqual(vendo.inventory["Candy Bar"]!.count, 7)
        
        XCTAssertEqual(vendo.inventory["Chips"]!.price, 10)
        XCTAssertEqual(vendo.inventory["Chips"]!.count, 4)
        
        XCTAssertEqual(vendo.inventory["Pretzels"]!.price, 7)
        XCTAssertEqual(vendo.inventory["Pretzels"]!.count, 11)
    }
    
    func testSucessfulVend() {
        let vendo = VendingMachine()
        vendo.coinsDeposited = 50
        XCTAssertNoThrow(try vendo.vend(itemNamed: "Candy Bar"))
        XCTAssertEqual(vendo.inventory["Candy Bar"]!.count, 6)
        XCTAssertEqual(vendo.coinsDeposited, 38)
        XCTAssertNoThrow(try vendo.vend(itemNamed: "Chips"))
        XCTAssertEqual(vendo.inventory["Chips"]!.count, 3)
        XCTAssertEqual(vendo.coinsDeposited, 28)
        XCTAssertNoThrow(try vendo.vend(itemNamed: "Pretzels"))
        XCTAssertEqual(vendo.inventory["Pretzels"]!.count, 10)
        XCTAssertEqual(vendo.coinsDeposited, 21)
    }
    
    func testInvalidSelection() {
        let vendo = VendingMachine()
        XCTAssertThrowsError(try vendo.vend(itemNamed: "X")) {
            error in
            XCTAssertEqual(error as? VendingMachineError, VendingMachineError.invalidSelection)
        }
    }
    
    func testOutOfStock() {
        let vendo = VendingMachine()
        vendo.coinsDeposited = 20
        vendo.inventory["Candy Bar"] = Item(price: 10, count: 0)
        
        XCTAssertThrowsError(try vendo.vend(itemNamed: "Candy Bar")) {
            error in
            XCTAssertEqual(error as? VendingMachineError, VendingMachineError.outOfStock)
        }
    }
    
    func testinsufficientFunds() {
        let vendo = VendingMachine()
        
        XCTAssertThrowsError(try vendo.vend(itemNamed: "Candy Bar")) {
            error in
            XCTAssertEqual(error as? VendingMachineError, VendingMachineError.insufficientFunds)
        }
    }
}
