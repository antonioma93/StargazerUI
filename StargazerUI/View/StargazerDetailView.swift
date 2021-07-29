//
//  StargazerDetailView.swift
//  StargazerUI
//
//  Created by Massa Antonio on 27/07/21.
//

import SwiftUI

struct StargazerDetailView: View {
	@EnvironmentObject var dataController: DataController
	let stargazer: Stargazer

	var body: some View {
		ScrollView {
			ZStack(alignment: .bottomTrailing) {
				StargazerHeaderView(stargazer: stargazer)
			}
			VStack(alignment: .leading) {
				Text("User: \(stargazer.login)")
					.headerStyle()
				Text("\(stargazer.description)")
					.padding(.bottom)
				Text("More info about me?")
					.headerStyle()
				Text("Have a look on my GitHub page:")
				Link("\(stargazer.html_url)", destination: URL(string: "\(stargazer.html_url)")!)
					.padding(.bottom)
				Text("Email me if you need!")
					.headerStyle()
				Link("\(stargazer.email)", destination: URL(string: "\(stargazer.email)")!)
				HStack {
					Spacer()
					Button(dataController.isFavorite(stargazer) ? "Remove Favorite" : "Add Favorite", action: toggleFavorite)
						.buttonStyle(PrimaryDetailButtonStyle())
					Spacer()
				}
				.padding()
			}
			.padding(.horizontal)
		}
		.navigationTitle(stargazer.login)
	}
}

struct StargazerDetailView_Previews: PreviewProvider {
    static var previews: some View {
		StargazerDetailView(stargazer: Stargazer.example)
			.environmentObject(DataController())
    }
}

extension StargazerDetailView {
	func toggleFavorite() {
		dataController.toggleFavorite(stargazer)
	}
}

extension Text {
	func headerStyle() -> some View {
		self
			.font(.title)
			.foregroundColor(.black)
			.fontWeight(.bold)
			.textCase(.uppercase)
	}
}

struct PrimaryDetailButtonStyle: ButtonStyle {
	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.padding()
			.background(configuration.isPressed ? Color.blue.opacity(0.5) : Color.blue)
			.foregroundColor(.white)
			.clipShape(Capsule())
	}
}
