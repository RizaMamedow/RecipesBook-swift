//
//  CategoryController.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 17.08.2024.
//

import Foundation


class CategoryController: APIRequesting, RefreshableController, ObservableObject {
    typealias T = CategoryMealList
    
    static var apiCaller: APICaller<T> = .init(urlString: "https://www.themealdb.com/api/json/v1/1/filter.php")
    
    @Published var isLoaded: Bool = false
    
    var categoryName: String
    
    @Published var mealsList: T?
    
    private func performCall(){
        Self.apiCaller.performCall(["c": categoryName]){ data in
            self.mealsList = data
            self.isLoaded = true
        }
    }
    
    init(categoryName: String) {
        self.categoryName = categoryName
        performCall()
    }
    
    func refresh() {
        self.mealsList = nil
        self.isLoaded = false
        performCall()
    }
}
