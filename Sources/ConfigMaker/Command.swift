// Created on 04.12.20

import Foundation
import ArgumentParser

// see https://github.com/apple/swift-argument-parser
struct Command: ParsableCommand {
	@Option(name: [.customLong("output-name"), .customShort("o")], help: "Output file name")
	var filename: String?

	mutating func run() throws {
		let name = filename ?? "config.json"
		print("Generating config file with name [\(name)]")
		try ConfigMaker.makeConfig(path: name)
		print("... done!")
	}
}
