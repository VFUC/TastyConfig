// Created on 04.12.20

import Foundation

public struct Configuration: Codable {
	let baseURL: String
	let feed: String
}

public let configuration = Configuration(
	baseURL: "https://api.my.app",
	feed: "/feed"
)
