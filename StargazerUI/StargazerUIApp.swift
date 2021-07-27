//
//  StargazerUIApp.swift
//  StargazerUI
//
//  Created by Massa Antonio on 27/07/21.
//

import SwiftUI

@main
struct StargazerUIApp: App {
	@StateObject var dataController = DataController()
    var body: some Scene {
        WindowGroup {
			StargazerListView()
			.environmentObject(dataController)
        }
    }
}
