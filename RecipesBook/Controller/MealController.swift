//
//  MealController.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 19.08.2024.
//

import Foundation


class MealController: APIRequesting, RefreshableController, ObservableObject {
    typealias T = MealListInstance
    
    static var apiCaller: APICaller<T> = .init(urlString: "https://www.themealdb.com/api/json/v1/1/lookup.php")
    
    @Published var isLoaded: Bool = false
    var mealId: String
    
    @Published var mealData: T?
    @Published var disclosureController: MealDetailsDisclosureController = .init()
    
    private func performCall() {
        Self.apiCaller.performCall(["i": self.mealId]){ data in
            self.mealData = data
            self.isLoaded = true
        }
    }
    
    init(mealId: String) {
        self.mealId = mealId
        
        performCall()
    }
    
    func refresh() {
        self.isLoaded = false
        self.mealData = nil
    
        performCall()
    }
    
    
}
