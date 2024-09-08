//
//  WishlistModel.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 27.08.2024.
//

import Foundation
import SwiftData


class WishlistModel: ObservableObject, BaseModelProtocol {
    var context: ModelContext
    
    init(context: ModelContext) {
        self.context = context
    }
    
    typealias T = WishlistItem
    
    func save(_ object: T) -> Void {
        context.insert(object)
    }
    
    func delete(_ id: String) -> Void {
        do {
            try context.delete(model: T.self, where: #Predicate<WishlistItem> { instance in
                instance.id == id
            })
        } catch {
            print("Error in swiftdata logic")
        }
    }
    
    func getById(_ id: String) -> (any PersistentModel)? {
        do {
            let predicate = #Predicate<WishlistItem>{ object in
                object.id == id
            }
            var descriptor = FetchDescriptor(predicate: predicate)
            descriptor.fetchLimit = 1
            let wearable = try context.fetch(descriptor)
            
            return wearable.first
        } catch {
            print("Error in swiftdata logic")
            return nil
        }
    }
}

