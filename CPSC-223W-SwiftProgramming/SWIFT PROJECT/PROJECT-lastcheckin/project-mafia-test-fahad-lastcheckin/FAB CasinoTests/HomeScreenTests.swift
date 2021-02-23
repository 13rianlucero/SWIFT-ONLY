//
//  HomeScreenTests.swift
//  FAB CasinoTests
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//

import XCTest
@testable import FAB_Casino

class HomeScreenTests: XCTestCase {
    var vm: HomeViewModel?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vm = HomeViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testGetTotalTableCount() throws {
        XCTAssert(vm?.getTotalTableCount() == 3, "There are total 3 table")
    }
    
    func testGetTotalGameCount() throws {
        XCTAssert(vm?.getTotalGameCount() == 3, "There are total 3 type of games")
    }
    
    func testGetGameForIndex() throws {
        XCTAssert(vm?.getGameForIndex(0) == "Roulette")
    }
    
    func testGetTableForIndex() throws {
        XCTAssert(vm?.getTableForIndex(1) == "table2")
    }
    
    func testGetGameForInvalidIndex() throws {
        XCTAssert(vm?.getGameForIndex(10) == "")
    }
    
    func testGetTableForInvalidIndex() throws {
        XCTAssert(vm?.getTableForIndex(11) == "")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
