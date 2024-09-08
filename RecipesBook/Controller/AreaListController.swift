//
//  AreaListController.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 20.08.2024.
//

import Foundation


class AreaListController: APIRequesting, ObservableObject {
    typealias T = AreasListInstance
    
    static var apiCaller: APICaller<T> = .init(urlString: "https://www.themealdb.com/api/json/v1/1/list.php?a=list")
    
    @Published var isLoaded: Bool = false
    
    @Published var areaList: T?
    
    init() {
        Self.apiCaller.performCall{ data in
            self.areaList = data
            self.isLoaded = true
        }
    }
}
