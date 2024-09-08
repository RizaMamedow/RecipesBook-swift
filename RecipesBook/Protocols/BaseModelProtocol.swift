//
//  BaseModelProtocol.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 27.08.2024.
//

import Foundation
import SwiftData

protocol BaseModelProtocol {
    var context: ModelContext { get }
    
    func delete(_ object: any PersistentModel) -> Void
    func save(_ object: any PersistentModel) -> Void
}
