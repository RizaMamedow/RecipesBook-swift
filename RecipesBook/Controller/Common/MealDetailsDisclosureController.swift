//
//  MealDetailsDisclosureController.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 17.08.2024.
//

import Foundation

class MealDetailsDisclosureController: MealDetailsControllerProtocol, ObservableObject {
    @Published var revealIngredients: Bool = false
    @Published var revealMesurement: Bool = false
    @Published var revealInstuctions: Bool = true
}
