//
//  AreaMealsController.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 19.08.2024.
//

import Foundation



class AreaMealsController: APIRequesting, RefreshableController, ObservableObject {
    typealias T = CategoryMealList
    
    static var apiCaller: APICaller<T> = .init(urlString: "https://www.themealdb.com/api/json/v1/1/filter.php")
    
    @Published var isLoaded: Bool = false
    
    @Published var areaName: String
    
    @Published var mealsList: T?
    
    private func performCall(){
        Self.apiCaller.performCall(["a": areaName]){ data in
            self.mealsList = data
            self.isLoaded = true
        }
    }
    
    init(areaName: String) {
        self.areaName = areaName
        performCall()
    }
    
    func refresh() {
        self.mealsList = nil
        self.isLoaded = false
        performCall()
    }
}
