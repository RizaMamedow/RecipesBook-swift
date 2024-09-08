//
//  RecipesBookApp.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 10.08.2024.
//

import SwiftUI
import SwiftData

@main
struct RecipesBookApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            WishlistItem.self,
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .modelContainer(sharedModelContainer)
    }
}
