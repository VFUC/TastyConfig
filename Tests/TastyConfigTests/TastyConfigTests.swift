import XCTest
@testable import TastyConfig

final class TastyConfigTests: XCTestCase {
    func testConfigEncodeDecode() throws {
		let configData = try JSONEncoder().encode(Configuration.production)
		let _ = try JSONDecoder().decode(Configuration.self, from: configData)
    }
	
	func testBundledFeeds() throws {
		let paths = Bundle.module.paths(forResourcesOfType: "json", inDirectory: "FeedsToTest")
		print("Found \(paths.count) config resources for testing")
		try paths.forEach({ path in
			print("Testing decoding of \(path)")
			
			let url = try XCTUnwrap(URL(fileURLWithPath: path))
			let data = try Data(contentsOf: url)
			XCTAssertNoThrow(try Configuration.decoded(from: data))
		})
	}

    static var allTests = [
        ("testConfigEncodeDecode", testConfigEncodeDecode),
		("testBundledFeeds", testBundledFeeds),
    ]
}
