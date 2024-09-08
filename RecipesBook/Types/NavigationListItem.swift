//
//  NavigationListItem.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 16.08.2024.
//

import Foundation
import SwiftUI


struct NavigationListItem {
    var name: String
    var destination: AnyView
    var iconName: String?
    
    init(name: String, destination: any View, iconName: String? = nil) {
        self.name = name
        self.destination = AnyView(destination)
        self.iconName = iconName
    }
}
