//
//  CategoryListController.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 10.08.2024.
//

import Foundation
import SwiftUI


class CategoryListController: APIRequesting, ObservableObject {
    typealias T = CategoryListInstance
    
    static var apiCaller: APICaller<T> = .init(urlString: "https://www.themealdb.com/api/json/v1/1/categories.php")
    
    @Published var isLoaded: Bool = false
    
    @Published var categoryList: T?
    
    init() {
        Self.apiCaller.performCall{ data in
            self.categoryList = data
            self.isLoaded = true
        }
    }
}
