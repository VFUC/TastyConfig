// Created on 04.12.20

import Foundation
import ArgumentParser
import TastyConfig

// see https://github.com/apple/swift-argument-parser
struct Command: ParsableCommand {
	@Option(name: [.customLong("output-name"), .customShort("o")], help: "Output file name")
	var filename: String?
	
	@Argument(help: "The configuration environment to make [\(Configuration.all.map(\.identifier).joined(separator: ","))]")
	var environment: String

	mutating func run() throws {
		let name = filename ?? "config-\(environment).json"
		print("Generating config file with name [\(name)]")
		
		if let matchingConfig = Configuration.all.first(where: { $0.identifier == environment }) {
			try ConfigMaker.makeConfig(path: name, configuration: matchingConfig)
		} else {
			print("Unknown environment given. Aborting.")
			return
		}
		
		print("... done!")
	}
}
