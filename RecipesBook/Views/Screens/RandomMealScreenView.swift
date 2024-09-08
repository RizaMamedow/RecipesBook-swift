//
//  RandomMealScreenView.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 16.08.2024.
//

import SwiftUI

struct RandomMealScreenView: View {
    @StateObject var controller: RandomMealController = .init()
    @Environment(\.modelContext) private var context
    
    var body: some View {
        NavigationStack {
            VStack{
                if controller.mealData != nil && controller.isLoaded {
                    let meal = controller.mealData!.meals[0]
                    
                    MealDetailsView(meal: meal)
                        .environmentObject(controller.disclosureController)
                        .environmentObject(WishlistModel.init(context: context))
                } else if !controller.isLoaded && controller.mealData == nil {
                    LoadingView()
                } else {
                    ErrorView()
                }
            }
            .navigationTitle("Random Meal")
        }
    }
}

#Preview {
    RandomMealScreenView()
}
