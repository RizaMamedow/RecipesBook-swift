//
//  as.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 10.08.2024.
//

import Foundation

protocol APIRequesting {
    associatedtype T: Decodable
    
    static var apiCaller: APICaller<T> { get set }
    var isLoaded: Bool { get set }
}
