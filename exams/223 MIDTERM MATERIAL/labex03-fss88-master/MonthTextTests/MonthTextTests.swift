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
    
    
    // Check if Regular initializer sets 1 to number, and if number exists.
    func initializerTest1()
    {
        let aMonth = Month();
        XCTAssertEqual(aMonth.number, 1);
    }
    
    //Makes sure that if paramater entered is outside 1-12, it assignes 1 to number, and "invalid" to name
    func initializerTest2()
    {
        let aMonth = Month(13);
        XCTAssertEqual(aMonth.number, 1, "input has to be 1-12");
        XCTAssertEqual(aMonth.name, "Invalid");
    }
    
    //Checks if override initializer sets/computes properties correctly
    func initializerTestComputed()
    {
        let aMonth = Month(1);
        XCTAssertEqual(aMonth.number, 1);
        XCTAssertEqual(aMonth.name, "January");
    }
    
    
    //Checks in override Initializer sets paramater input to number, and month to according name
    func initializerTestInputTaken()
    {
        let months = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        
        for index in 1...12 {
            let aMonth = Month(index);
            XCTAssertEqual(aMonth.number, index);
            XCTAssertEqual(aMonth.name, months[index-1], "lol what happend to August professor?");
        }
    }
    
    func initializerTestInputNotEqual()
    {
        let aMonth = Month(8);
        XCTAssertNotEqual(aMonth.number, 3);
        XCTAssertNotEqual(aMonth.name, "August");
    }
    
    
    
}
