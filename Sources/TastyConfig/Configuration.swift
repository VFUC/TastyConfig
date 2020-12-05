// Created on 04.12.20

import Foundation

/// Used to encode/decode config feed
public struct Configuration: Codable {
	public let identifier: String
	let baseURL: String
	let feed: String
}

extension Configuration {
	/// This instance is used by ConfigMaker to generate the current version of the config feed
	public static var production: Configuration {
		Configuration(identifier: "production",
					  baseURL: "https://api.my.app",
					  feed: "/feed")
	}
	
	public static var stage: Configuration {
		Configuration(identifier: "stage",
					  baseURL: "https://stage.api.my.app",
					  feed: "/feed")
	}
	
	public static var all: [Configuration] {
		return [production, stage]
	}
}
