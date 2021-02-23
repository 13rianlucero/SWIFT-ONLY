//
//  OrderTests.swift
//  SteakhouseTests
//
//  Created by Paul Inventado on 9/5/20.
//  Copyright © 2020 CSUF. All rights reserved.
//

import XCTest
@testable import Steakhouse

class OrderTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitializer() {
        let myOrder = Order(customerName: "Christina Tosi", tableNumber: 1, orders: 4)
        XCTAssertEqual(myOrder.customerName, "Christina Tosi")
        XCTAssertEqual(myOrder.tableNumber, 1)
        XCTAssertEqual(myOrder.orders, 4)
        XCTAssertEqual(myOrder.preparedOrders, 0)
    }
    
    func testPreparation1() {
        var myOrder = Order(customerName: "Bobby Flay", tableNumber: 1, orders: 4)
        myOrder.preparedOrders = 1
        XCTAssertEqual(myOrder.status, "In preparation")
    }
    
    func testPreparation2() {
        var myOrder = Order(customerName: "Anthony Bourdain", tableNumber: 1, orders: 10)
        myOrder.preparedOrders = 3
        XCTAssertEqual(myOrder.status, "In preparation")
    }
    
    func testCompleteOrder() {
        var myOrder = Order(customerName: "Padma Lakshmi", tableNumber: 1, orders: 5)
        myOrder.preparedOrders = 5
        XCTAssertEqual(myOrder.status, "Complete")
    }
}
