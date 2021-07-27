//
//  DataController.swift
//  StargazerUI
//
//  Created by Massa Antonio on 27/07/21.
//

import Foundation

class DataController: ObservableObject {
	@Published private var favorites: Set<String>
	let stargazers: [Stargazer]

	var primary: Stargazer {
		stargazers[0]
	}

	init() {
		let savedStargazer = UserDefaults.standard.stringArray(forKey: "Favorites") ?? []
		favorites = Set(savedStargazer)

		guard let url = Bundle.main.url(forResource: "detail", withExtension: "json") else {
			fatalError("Can't locate detail.json in the app bundle")
		}
		guard let data = try? Data(contentsOf: url) else {
			fatalError("Can't load detail.json in the app bundle")
		}
		guard let decoded = try? JSONDecoder().decode([Stargazer].self, from: data) else {
			fatalError("Can't decode detail.json in the app bundle")
		}
		stargazers = decoded.sorted { $0.login < $1.login }
	}

	func isFavorite(_ stargazer: Stargazer) -> Bool {
		favorites.contains(stargazer.login)
	}

	func toggleFavorite(_ stargazer: Stargazer) {
		if favorites.contains(stargazer.login) {
			favorites.remove(stargazer.login)
		} else {
			favorites.insert(stargazer.login)
		}
		UserDefaults.standard.set(Array(favorites), forKey: "Favorites")
	}
}
