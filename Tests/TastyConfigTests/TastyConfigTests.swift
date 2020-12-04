import XCTest
@testable import TastyConfig

final class TastyConfigTests: XCTestCase {
    func testConfigEncodeDecode() throws {
		let configData = try JSONEncoder().encode(configuration)
		let _ = try JSONDecoder().decode(Configuration.self, from: configData)
    }

    static var allTests = [
        ("testConfigEncodeDecode", testConfigEncodeDecode),
    ]
}
