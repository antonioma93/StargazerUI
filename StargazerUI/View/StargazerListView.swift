//
//  ContentView.swift
//  StargazerUI
//
//  Created by Massa Antonio on 27/07/21.
//

import SwiftUI

struct StargazerListView: View {
	@EnvironmentObject var dataController: DataController
	@State private var showingFavorites = false

	var body: some View {
		NavigationView {
			List {
				Section(header: Text("List of Stargazer")) {
					ForEach(items, content: StargazerRowView.init)
						.padding(6)
				}
			}
			.listStyle(GroupedListStyle())
			.navigationTitle("Stargazers")
			.toolbar {
				favoritesButton
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        StargazerListView()
			.environmentObject(DataController())
    }
}

extension StargazerListView {
	func toggleFavorite() {
		withAnimation {
			showingFavorites.toggle()
		}
	}
	var favoritesButton: some View {
		Button(action: toggleFavorite) {
			if showingFavorites {
				Text("Show all")
					.padding()
					.overlay(
					RoundedRectangle(cornerRadius: 10)
						.stroke(Color.blue, lineWidth: 2)
					)
			} else {
				Text("Show favorites")
					.padding()
					.overlay(
					RoundedRectangle(cornerRadius: 10)
						.stroke(Color.blue, lineWidth: 2)
					)
			}
		}
		.offset(y: -8)
	}
	var items: [Stargazer] {
		if showingFavorites {
			return dataController.stargazers.filter(dataController.isFavorite)
		} else {
			return dataController.stargazers
		}
	}
}
