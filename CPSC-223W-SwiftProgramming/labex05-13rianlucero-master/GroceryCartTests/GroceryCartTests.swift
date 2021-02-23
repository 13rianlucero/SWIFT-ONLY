//
//  GroceryCartTests.swift
//  GroceryCartTests
//
//  Created by Paul Inventado on 9/22/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import XCTest
@testable import GroceryCart

class GroceryCartTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCartInitializer() {
        let myCart = Cart()
        XCTAssertEqual(myCart.items.count, 0)
    }
    
    func testAddNewItem1() {
        var myCart = Cart()
        myCart.add("Milk", quantity: 2)
        XCTAssertEqual(myCart.items["Milk"], 2)
    }
    
    func testAddNewItem2() {
        var myCart = Cart()
        myCart.add("Eggs", quantity: 5)
        XCTAssertEqual(myCart.items["Eggs"], 5)
    }
    
    func testAddExistingItem1() {
        var myCart = Cart()
        myCart.add("Milk", quantity: 1)
        myCart.add("Milk", quantity: 3)
        XCTAssertEqual(myCart.items["Milk"], 4)
    }
    
    func testAddExistingItem2() {
        var myCart = Cart()
        myCart.add("Eggs", quantity: 8)
        myCart.add("Eggs", quantity: 2)
        XCTAssertEqual(myCart.items["Eggs"], 10)
    }
    
    func testTotalAmountSingleItem() {
        var myCart = Cart()
        myCart.add("Eggs", quantity: 8)
        XCTAssertEqual(myCart.totalItems, 8)
    }
    
    func testTotalAmountSingleItem2() {
        var myCart = Cart()
        myCart.add("Milk", quantity: 4)
        XCTAssertEqual(myCart.totalItems, 4)
    }
    
    func testTotalAmountMultipleItems1() {
        var myCart = Cart()
        myCart.add("Eggs", quantity: 8)
        myCart.add("Milk", quantity: 3)
        XCTAssertEqual(myCart.totalItems, 11)
    }
    
    func testTotalAmountMultipleItems2() {
        var myCart = Cart()
        myCart.add("Eggs", quantity: 1)
        myCart.add("Milk", quantity: 4)
        XCTAssertEqual(myCart.totalItems, 5)
    }
    
    func testPrintOut1() {
        var myCart = Cart()
        myCart.add("Eggs", quantity: 1)
        myCart.add("Milk", quantity: 4)
        XCTAssert(myCart.printOut == "Eggs: 1\nMilk: 4\n" || myCart.printOut == "Milk: 4\nEggs: 1\n")
    }
    
    func testPrintOut2() {
        var myCart = Cart()
        myCart.add("Cheese", quantity: 6)
        myCart.add("Ham", quantity: 3)
        XCTAssert(myCart.printOut == "Cheese: 6\nHam: 3\n" || myCart.printOut == "Ham: 3\nCheese: 6\n")
    }

}
