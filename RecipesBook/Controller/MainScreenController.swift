//
//  MainScreenController.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 10.08.2024.
//

import Foundation
import SwiftUI


class MainScreenController: ObservableObject {    
    @Published var navigationListItems: [NavigationListItem] = [
        .init(name: "Meal by category", destination: CategoryListScreenView(), iconName: "square.grid.2x2.fill"),
        .init(name: "Meal by area", destination: AreaListScreenView(), iconName: "location.fill"),
        .init(name: "Random Meal", destination: RandomMealScreenView(), iconName: "dice.fill"),
        .init(name: "Wishlist", destination: WishlistScreenView(), iconName: "heart.fill")
    ]
}
