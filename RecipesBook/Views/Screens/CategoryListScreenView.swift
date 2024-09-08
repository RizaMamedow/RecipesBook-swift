//
//  CategoryListScreenView.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 10.08.2024.
//

import Foundation
import SwiftUI


struct CategoryListScreenView: View {
    @StateObject var controller: CategoryListController = .init()

    var body: some View {
        NavigationStack {
            VStack {
                if (controller.isLoaded) {
                    if(controller.categoryList != nil) {
                        List(controller.categoryList!.categories, id: \.strCategory){ element in
                            NavigationLink {
                                CategoryScreenView(category: element.strCategory)
                            } label: {
                                Text(element.strCategory)
                            }
                        }
                    } else {
                        ErrorView("Categories not loaded")
                    }
                } else {
                    LoadingView()
                }
            }
            .navigationTitle("Categories")
        }
    }
}

#Preview {
    CategoryListScreenView()
}
