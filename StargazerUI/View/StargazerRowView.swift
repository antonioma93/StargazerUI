//
//  StargazerRowView.swift
//  StargazerUI
//
//  Created by Massa Antonio on 27/07/21.
//

import SwiftUI

struct StargazerRowView: View {
	var stargazer: Stargazer

	var body: some View {
		NavigationLink(destination: StargazerDetailView(stargazer: stargazer)) {
			imageStyle()
			VStack(alignment: .leading) {
				Text(stargazer.login)
					.font(.headline)
				Text(stargazer.node_id)
					.font(.caption)
					.foregroundColor(.red)
			}
		}
	}
}

struct StargazerRowView_Previews: PreviewProvider {
	static var previews: some View {
		StargazerRowView(stargazer: Stargazer.example)
	}
}

extension StargazerRowView {
	func imageStyle() -> some View {
		return Image(stargazer.picture)
			.resizable()
			.frame(width: 80, height: 80)
			.cornerRadius(40)
			.shadow(color: .black, radius: 8)
	}
}
