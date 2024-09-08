//
//  MealInfo.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 20.08.2024.
//

import Foundation

struct MealInfo: MealMainInfoProtocol, WithEmptyInstance, Decodable {
    var idMeal: String
    var strMeal: String
    var strMealThumb: String
    
    static func createEmptyInstance() -> MealInfo {
        return .init(idMeal: "0", strMeal: "Name", strMealThumb: "https://lh6.googleusercontent.com/proxy/OPyFO_EQnm3_1bbPdLNo6fudS9Pm7GVlugq0lONpRB56kU2d3_v5yyCcJK7lS206xxJ5YkLpM8CuvHoWqOWcq96H1ew6_gpYgGEWuQ-vfQ")
    }
}
