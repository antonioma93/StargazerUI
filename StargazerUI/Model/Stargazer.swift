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
	let picture: String
	let avatar_url: String
	let description: String
	let html_url: String

	static let example = Stargazer(login: "schacon", id: 1, picture: "1", avatar_url: "avatar", description: "Nice", html_url: "https://github.com/schacon")
}
