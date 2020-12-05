// Created on 04.12.20

import Foundation
import TastyConfig

/// Helper used to generate config feed
struct ConfigMaker {
	static func makeConfig(path: String, configuration: Configuration) throws {
		let data = try configuration.encoded()
		let url = URL(fileURLWithPath: path)
		try data.write(to: url)
	}
}
