//
//  BudgetAllocatorTests.swift
//  BudgetAllocatorTests
//
//  Created by Paul Inventado on 10/14/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

@testable import BudgetAllocator
import XCTest

class BudgetAllocatorTests: XCTestCase {
    func testBudgetCategory() {
        var temp: BudgetCategory
        temp = .home
        temp = .transportation
        temp = .groceries
        temp = .dining
        temp = .entertainment
    }
    
    func testInitializer() {
        _ = BudgetManager()
    }
    
    func testInitializerDefaultValues() {
        let manager = BudgetManager()
        XCTAssertEqual(manager.runningTotal, 0.0)
    }
    
    func testAllocateHome() {
        var manager = BudgetManager()
        let result = manager.allocate(category: .home, amount: 20)
        XCTAssertTrue(result)
        XCTAssertEqual(manager.allocation[.home], 20)
        XCTAssertEqual(manager.runningTotal, 20)
    }
    
    func testAllocateTransportation() {
        var manager = BudgetManager()
        let result = manager.allocate(category: .transportation, amount: 30)
        XCTAssertTrue(result)
        XCTAssertEqual(manager.allocation[.transportation], 30)
        XCTAssertEqual(manager.runningTotal, 30)
    }
    
    func testAllocateGroceries() {
        var manager = BudgetManager()
        let result = manager.allocate(category: .groceries, amount: 40)
        XCTAssertTrue(result)
        XCTAssertEqual(manager.allocation[.groceries], 40)
        XCTAssertEqual(manager.runningTotal, 40)
    }
    
    func testAllocateDining() {
        var manager = BudgetManager()
        let result = manager.allocate(category: .dining, amount: 10)
        XCTAssertTrue(result)
        XCTAssertEqual(manager.allocation[.dining], 10)
        XCTAssertEqual(manager.runningTotal, 10)
    }
    
    func testAllocateEntertainment() {
        var manager = BudgetManager()
        let result = manager.allocate(category: .entertainment, amount: 90)
        XCTAssertTrue(result)
        XCTAssertEqual(manager.allocation[.entertainment], 90)
        XCTAssertEqual(manager.runningTotal, 90)
    }
    
    func testAlllocateMultiple() {
        var manager = BudgetManager()
        _ = manager.allocate(category: .entertainment, amount: 10)
        let result = manager.allocate(category: .dining, amount: 30)
        XCTAssertTrue(result)
        XCTAssertEqual(manager.allocation[.dining], 30)
        XCTAssertEqual(manager.runningTotal, 40)
    }
    
    func testAlllocateReplace() {
        var manager = BudgetManager()
        _ = manager.allocate(category: .entertainment, amount: 90)
        let result = manager.allocate(category: .entertainment, amount: 80)
        XCTAssertTrue(result)
        XCTAssertEqual(manager.allocation[.entertainment], 80)
        XCTAssertEqual(manager.runningTotal, 80)
    }
    
    func testFailAllocate() {
        var manager = BudgetManager()
        _ = manager.allocate(category: .groceries, amount: 40)
        let result = manager.allocate(category: .entertainment, amount: 90)
        XCTAssertFalse(result)
        XCTAssertEqual(manager.allocation[.entertainment], nil)
        XCTAssertEqual(manager.runningTotal, 40)
    }
}
