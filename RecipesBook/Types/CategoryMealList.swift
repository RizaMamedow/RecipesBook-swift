//
//  CategoryMealList.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 17.08.2024.
//

import Foundation


struct CategoryMealList: DefaultResponseProtocol, Decodable {
    typealias T = MealInfo
    
    var meals: [T]
}
