//
//  MainScreenListItem.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 16.08.2024.
//

import SwiftUI

struct MainScreenListItem: View {
    @Binding var item: NavigationListItem
    
    var body: some View {
        NavigationLink(destination: item.destination) {
            Label(item.name, systemImage: item.iconName ?? "")
        }
    }
}
