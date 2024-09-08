//
//  RandomMealController.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 16.08.2024.
//

import Foundation


class RandomMealController: APIRequesting, RefreshableController, ObservableObject {
    typealias T = MealListInstance
    
    static var apiCaller: APICaller<T> = .init(urlString: "https://www.themealdb.com/api/json/v1/1/random.php")
    
    @Published var isLoaded: Bool = false
    
    @Published var mealData: T?
    @Published var disclosureController: MealDetailsDisclosureController = .init()
    
    func performCall() {
        Self.apiCaller.performCall{ data in
            self.mealData = data
            self.isLoaded = true
        }
    }
    
    init() {
        performCall()
    }
    
    func refresh() {
        mealData = nil
        isLoaded = false
        performCall()
    }
}
