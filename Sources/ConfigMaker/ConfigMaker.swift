// Created on 04.12.20

import Foundation
import TastyConfig

/// Helper used to generate config feed
struct ConfigMaker {
	static func makeConfig(path: String, configuration: Configuration) throws {
	  let config = try JSONEncoder().encode(configuration)
		  
	  let url = URL(fileURLWithPath: path)
	  try config.write(to: url)
	}
}
