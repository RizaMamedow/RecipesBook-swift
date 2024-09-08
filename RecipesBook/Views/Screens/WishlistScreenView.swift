//
//  WishlistScreenView.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 27.08.2024.
//

import SwiftUI
import SwiftData

struct WishlistScreenView: View {
    @Query private var wishlist: [WishlistItem]
    
    var body: some View {
        NavigationStack {
            VStack {
                ScrollView {
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ]) {
                        ForEach(wishlist, id: \.id) { meal in
                            MealCard(meal: .init(
                                idMeal: meal.id,
                                strMeal: meal.name,
                                strMealThumb: meal.thumb
                            ))
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .navigationTitle("Wishlist")
        }
    }
}

#Preview {
    WishlistScreenView()
}
