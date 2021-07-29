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
			setImage()
		}
	}
}

struct StargazerHeaderView_Previews: PreviewProvider {
	static var previews: some View {
		StargazerHeaderView(stargazer: Stargazer.example)
			.environmentObject(DataController())
	}
}

extension StargazerHeaderView {
	func setImage() -> some View {
		Image(systemName: "star.fill").renderingMode(.original)
			.foregroundColor(.white)
			.padding()
			.background(Color.blue)
			.clipShape(Circle())
			.rotationEffect(.degrees(-90))
			.overlay (
				Circle()
					.strokeBorder(Color.white, lineWidth: 2)
			)
			.offset(x: -10, y: -10)
	}
}
