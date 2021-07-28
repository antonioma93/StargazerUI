//
//  Stargazer.swift
//  StargazerUI
//
//  Created by Massa Antonio on 27/07/21.
//

import Foundation

struct Stargazer: Decodable, Identifiable {
	let login: String
	let id: Int
	let node_id: String
	let picture: String
	let avatar_url: String
	let description: String
	let html_url: String
	let email: String

	static let example = Stargazer(login: "schacon", id: 1, node_id: "node_id", picture: "1", avatar_url: "avatar", description: "Nice", html_url: "https://github.com/schacon", email: "myemail@me.com")
}
