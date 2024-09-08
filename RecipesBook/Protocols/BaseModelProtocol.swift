//
//  BaseModelProtocol.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 27.08.2024.
//

import Foundation
import SwiftData

protocol BaseModelProtocol {
    associatedtype T
    
    var context: ModelContext { get }
    
    func delete(_ id: String) -> Void
    func save(_ object: T) -> Void
}
