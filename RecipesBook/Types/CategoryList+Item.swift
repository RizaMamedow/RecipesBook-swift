//
//  CategoryList+Item.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 10.08.2024.
//

import Foundation


struct CategoryListInstance: CategoryListResponseProtocol {
    var categories: [CategoryListItemInstance]
}

struct CategoryListItemInstance: CategoryListItemProtocol {
    var idCategory: String
    var strCategoryThumb: String
    var strCategoryDescription: String
    var strCategory: String
}
