//
//  RouletteTest.swift
//  FAB CasinoTests
//
//  Created by Fahad Alswailem on 9/22/20.
//  Copyright © 2020 Fahad Alswailem. All rights reserved.
//

import XCTest
@testable import FAB_Casino

class RouletteTest: XCTestCase {
    var vm: RoulleteViewModel?
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vm = RoulleteViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetTotalBetCount() throws {
        XCTAssert(vm?.getTotalBetCount() == 13, "There are total 13 type of games")
    }
    
    func testGetLocationSuggestionTest() throws {
        XCTAssert(vm?.getLocationSuggestionTest(bet: "Straight") == "enter a location from 1-36")
    }
    
    func testGetLocationSuggestionTestWithInvalidBet() throws {
        XCTAssert(vm?.getLocationSuggestionTest(bet: "adak") == "PICK A BET")
    }
    
    func testGetPlayerBalance() {
        XCTAssert(vm?.getPlayerBalance() ?? 0 >= 0)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        
    }

}
