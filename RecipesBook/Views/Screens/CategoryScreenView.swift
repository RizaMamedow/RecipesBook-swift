//
//  CategoryScreenView.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 17.08.2024.
//

import SwiftUI

struct CategoryScreenView: View {
    var category: String
    @ObservedObject var controller: CategoryController
    
    init(category: String) {
        self.category = category
        self.controller = .init(categoryName: category)
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                if controller.mealsList != nil {
                    let meals = controller.mealsList!.meals
                    
                    ScrollView {
                        LazyVGrid(columns: [
                            GridItem(.flexible()),
                            GridItem(.flexible())
                        ]) {
                            ForEach(meals, id: \.idMeal) { meal in
                                MealCard(meal: meal)
                            }
                        }
                        .padding(.horizontal)
                    }
                } else if !controller.isLoaded && controller.mealsList == nil {
                    VStack {
                        LoadingView()
                    }
                    .frame(maxHeight: 500, alignment: .center)
                } else {
                    ErrorView()
                }
            }
            .refreshable {
                controller.refresh()
            }
            .navigationTitle(category)
        }
    }
}

#Preview {
    CategoryScreenView(category: "Seafood")
}
