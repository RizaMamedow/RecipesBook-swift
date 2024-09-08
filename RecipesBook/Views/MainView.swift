//
//  MainView.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 10.08.2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var controller: MainScreenController = .init()
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    Image("Banner")
                        .clipShape(.rect(cornerRadius: 8))
                        .padding(0)
                        .listRowBackground(Color.clear)
                }
                Section("Navigation"){
                    ForEach($controller.navigationListItems, id: \.name) { item in
                        MainScreenListItem(item: item)
                    }
                }
            }
            .navigationTitle("RecipesBook")
        }
    }
}

#Preview {
    MainView()
}
