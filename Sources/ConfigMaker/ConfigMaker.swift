// Created on 04.12.20

import Foundation
import TastyConfig

struct ConfigMaker {
	static func makeConfig(path: String = "config.json") throws {
	  let config = try JSONEncoder().encode(configuration)
		  
	  let url = URL(fileURLWithPath: path)
	  try config.write(to: url)
	}
}
