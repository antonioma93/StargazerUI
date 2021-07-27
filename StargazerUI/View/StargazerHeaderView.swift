//
//  StargazerHeaderView.swift
//  StargazerUI
//
//  Created by Massa Antonio on 27/07/21.
//

import SwiftUI

struct StargazerHeaderView: View {
	@EnvironmentObject var dataController: DataController
	var stargazer: Stargazer

	var body: some View {
		Image(stargazer.picture)
			.resizable()
			.scaledToFit()
		if dataController.isFavorite(stargazer) {
			Image(systemName: "heart.fill")
				.foregroundColor(.white)
				.padding()
				.background(Color.red)
				.clipShape(Circle())
				.overlay (
					Circle()
						.strokeBorder(Color.white, lineWidth: 2)
				)
				.offset(x: -10, y: -10)
		}
	}
}

struct StargazerHeaderView_Previews: PreviewProvider {
	static var previews: some View {
		StargazerHeaderView(stargazer: Stargazer.example)
			.environmentObject(DataController())
	}
}
