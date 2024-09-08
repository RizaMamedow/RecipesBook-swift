//
//  AreasList+Item.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 20.08.2024.
//

import Foundation


struct AreasListInstance: DefaultResponseProtocol {
    typealias T = AreasListItemInstance
    
    var meals: [T]
}

struct AreasListItemInstance: AreaListItemProtocol {
    var strArea: String
}
