//
//  AreaMealsScreenView.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 19.08.2024.
//

import SwiftUI

struct AreaMealsScreenView: View {
    var area: String
    @ObservedObject var controller: AreaMealsController
    
    init(area: String) {
        self.area = area
        self.controller = .init(areaName: area)
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
            .navigationTitle(area)
        }
    }
}

#Preview {
    AreaMealsScreenView(area: "Canadian")
}
