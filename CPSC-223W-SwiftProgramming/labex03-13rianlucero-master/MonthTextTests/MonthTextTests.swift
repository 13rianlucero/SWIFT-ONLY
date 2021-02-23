import XCTest 
@testable import MonthText

class MonthTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    // Provide your unit tests here

    // First condition to check is if the observed Month class has a property
    // called number. And considering if that test passes, then the follow-up test
    // would be to test if the default value for number is equal to 1. This tests
    // if an initializer function with no parameter list, exists in the Month
    // class:
    //   init() {
    //     number = 1
    //   }
    // Thus we can utilize the assert equal test from
    // https://developer.apple.com/documentation/xctest/2142776-xctassertequal

    func noInitValueTest() {
      let testMonth = Month();
      XCTAssertEqual(testMonth.number, 1);
    }

    // For my next unit tests, I will be testing for 2 things:
    // 1. if a property observer exists, if it does then it should determine
    // whether a number is set to a value outside of the [1,12] range.
    // 2. if the property observer, determines number is outside [1,12] range,
    // then it will set month.name property to "Invalid", and sets number property
    // equal to 1.

    func PropObservBelowRange()
    {
      let tMonth = Month(0);
      XCTAssertEqual(tMonth.number, 1, "number must be within range [1,12]");
      XCTAssertEqual(tMonth.name, "Invalid");
    }

    func PropObservAboveRange() 
    {
    	let tMonth = Month(13);
      	XCTAssertEqual(tMonth.number, 1, "number must be within range [1,12]");
      	XCTAssertEqual(tMonth.name, "Invalid");
    }
    
    func initComputedValueInRange() {
      let testMonth = Month(1);
      XCTAssertEqual(testMonth.number, 1);
      XCTAssertEqual(testMonth.name, "January");
    }

    // Next 2 things that can be tested:
    // 1. Test expected values of number; expected to be within a range [1,12]
    // 2. If number passes first test and is within range, then name property will
    // be tested to see if it is equal to expected month name string for
    // corresponding number.
    //      ex. if number = 3, name should be equal to "March", etc.

    func testExpectedValueRange() {
      let monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
      for index in 1...12 {
        let testMonth = Month(index);
        XCTAssertEqual(testMonth.number, index);
        XCTAssertEqual(testMonth.name, monthNames[index-1]);
      }
    }

    func initInputNotEqual() {
      let testMonth = Month(8);
      XCTAssertNotEqual(testMonth.number, 5);
      XCTAssertNotEqual(testMonth.name, "August");
    }
}
