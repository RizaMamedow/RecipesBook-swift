//
//  WishlistItem.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 10.08.2024.
//

import Foundation
import SwiftData

@Model
final class WishlistItem{
    var id: String
    var name: String
    var thumb: String
    
    init(id: String, name: String, thumb: String) {
        self.id = id
        self.name = name
        self.thumb = thumb
    }
}
