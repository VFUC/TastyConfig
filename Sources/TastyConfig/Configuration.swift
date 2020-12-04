// Created on 04.12.20

import Foundation

/// Used to encode/decode config feed
public struct Configuration: Codable {
	let baseURL: String
	let feed: String
}

/// This instance is used by ConfigMaker to generate the current version of the config feed
public let configuration = Configuration(
	baseURL: "https://api.my.app",
	feed: "/feed"
)
