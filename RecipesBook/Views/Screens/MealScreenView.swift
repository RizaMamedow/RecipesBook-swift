//
//  MealScreenView.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 19.08.2024.
//

import SwiftUI

struct MealScreenView: View {
    var mealId: String
    @ObservedObject var controller: MealController
    @Environment(\.modelContext) private var context
    
    init(mealId: String) {
        self.mealId = mealId
        self.controller = .init(mealId: mealId)
    }
    
    var body: some View {
        NavigationStack {
            VStack{
                if controller.mealData != nil {
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
            .refreshable {
                controller.refresh()
            }
        }
    }
}

#Preview {
    MealScreenView(mealId: "52772")
}
