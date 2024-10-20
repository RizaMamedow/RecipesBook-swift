//
//  CommonAPIProtocols.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 10.08.2024.
//

import Foundation

protocol WithEmptyInstance {
    static func createEmptyInstance() -> Self
}

protocol CategoryListResponseProtocol: Decodable {
    var categories: [CategoryListItemInstance] { get }
}

protocol CategoryListItemProtocol: Decodable {
    var idCategory: String { get }
    var strCategory: String { get }
    var strCategoryThumb: String { get }
    var strCategoryDescription: String { get }
}

protocol MealListItemIngredientsProtocol {
    var strIngredient1: String? { get }
    var strIngredient2: String? { get }
    var strIngredient3: String? { get }
    var strIngredient4: String? { get }
    var strIngredient5: String? { get }
    var strIngredient6: String? { get }
    var strIngredient7: String? { get }
    var strIngredient8: String? { get }
    var strIngredient9: String? { get }
    var strIngredient10: String? { get }
    var strIngredient11: String? { get }
    var strIngredient12: String? { get }
    var strIngredient13: String? { get }
    var strIngredient14: String? { get }
    var strIngredient15: String? { get }
    var strIngredient16: String? { get }
    var strIngredient17: String? { get }
    var strIngredient18: String? { get }
    var strIngredient19: String? { get }
    var strIngredient20: String? { get }
}

extension MealListItemIngredientsProtocol {
    func collectIngredients() -> [String] {
        return [
            strIngredient1, strIngredient2, strIngredient3, strIngredient4,
            strIngredient5, strIngredient6, strIngredient7, strIngredient8,
            strIngredient9, strIngredient10, strIngredient11, strIngredient12,
            strIngredient13, strIngredient14, strIngredient15, strIngredient16,
            strIngredient17, strIngredient18, strIngredient19, strIngredient20
        ].compactMap { $0?.trimmingCharacters(in: .whitespacesAndNewlines) }.filter { !$0.isEmpty }
    }
}

protocol MealListItemMeasurementProtocol {
    var strMeasure1: String? { get }
    var strMeasure2: String? { get }
    var strMeasure3: String? { get }
    var strMeasure4: String? { get }
    var strMeasure5: String? { get }
    var strMeasure6: String? { get }
    var strMeasure7: String? { get }
    var strMeasure8: String? { get }
    var strMeasure9: String? { get }
    var strMeasure10: String? { get }
    var strMeasure11: String? { get }
    var strMeasure12: String? { get }
    var strMeasure13: String? { get }
    var strMeasure14: String? { get }
    var strMeasure15: String? { get }
    var strMeasure16: String? { get }
    var strMeasure17: String? { get }
    var strMeasure18: String? { get }
    var strMeasure19: String? { get }
    var strMeasure20: String? { get }
}

extension MealListItemMeasurementProtocol {
    func collectMesurements() -> [String] {
        return [
            strMeasure1, strMeasure2, strMeasure3, strMeasure4,
            strMeasure5, strMeasure6, strMeasure7, strMeasure8,
            strMeasure9, strMeasure10, strMeasure11, strMeasure12,
            strMeasure13, strMeasure14, strMeasure15, strMeasure16,
            strMeasure17, strMeasure18, strMeasure19, strMeasure20
        ].compactMap { $0?.trimmingCharacters(in: .whitespacesAndNewlines) }.filter { !$0.isEmpty }
    }
}

protocol MealMainInfoProtocol {
    var idMeal: String { get }
    var strMeal: String { get }
    var strMealThumb: String { get }
}

protocol MealListItemProtocol: MealMainInfoProtocol, MealListItemIngredientsProtocol, MealListItemMeasurementProtocol, Decodable {
    var strCategory: String { get }
    var strArea: String { get }
    var strInstructions: String { get }
    var strTags: String? { get }
    var strYoutube: String? { get }
    var strSource: String? { get }
}

protocol DefaultResponseProtocol: Decodable {
    associatedtype T
    
    var meals: [T] { get }
}

protocol AreaListItemProtocol: Decodable {
    var strArea: String { get }
}
