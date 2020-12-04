import XCTest
@testable import TastyConfig

final class TastyConfigTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(TastyConfig().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
