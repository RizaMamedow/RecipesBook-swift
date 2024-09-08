//
//  MealCard.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 19.08.2024.
//

import SwiftUI

struct MealCard: View {
    var meal: MealInfo
    
    var body: some View {
        NavigationLink {
            MealScreenView(mealId: meal.idMeal)
        } label: {
            VStack {
                AsyncImage(url: URL(string: meal.strMealThumb)) { image in
                    image.resizable()
                } placeholder: {
                    VStack {
                        ProgressView()
                    }
                    .frame(minHeight: 150)
                    .frame(maxWidth: .infinity)
                }
                .frame(maxHeight: 150)
                .clipShape(.rect(cornerRadius: 15))
                .shadow(radius: 3)
                
                Text(meal.strMeal)
                    .font(.callout)
                    .foregroundStyle(.gray)
            }
        }
    }
}


#Preview {
    VStack{
        MealCard(meal: MealInfo.createEmptyInstance())
            .frame(maxWidth: 180)
    }
}
