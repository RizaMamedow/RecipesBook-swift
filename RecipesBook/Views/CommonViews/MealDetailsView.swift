//
//  MealDetailsView.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 17.08.2024.
//

import SwiftUI
import SwiftData

struct MealDetailsView: View {
    @EnvironmentObject var controller: MealDetailsDisclosureController
    @EnvironmentObject var model: WishlistModel
    
    var meal: MealListItemInstance
    
    @State var isInWishlist: Bool = false
    
    
    var body: some View {
        ScrollView {
            VStack {
                MealThumbnailView(meal.strMealThumb)
                
                HStack(alignment: .lastTextBaseline){
                    NavigationLink {
                        CategoryScreenView(category: meal.strCategory)
                    } label: {
                        HStack(spacing: 5){
                            Text(meal.strCategory)
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundStyle(.black)
                            Image(systemName: "arrowshape.turn.up.right")
                        }
                    }
                    
                    Spacer()
                    
                    NavigationLink {
                        AreaMealsScreenView(area: meal.strArea)
                    } label: {
                        HStack(spacing: 5){
                            Text(meal.strArea)
                                .font(.title3)
                                .foregroundStyle(.black)
                            Image(systemName: "arrowshape.turn.up.right")
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Divider()
                
                MealDisclosureGroupView(revealDisclosure: $controller.revealInstuctions, items: [meal.strInstructions], title: "Instructions")
                
                Divider()
                
                MealDisclosureGroupView(revealDisclosure: $controller.revealIngredients, items: meal.collectIngredients(), title: "Ingredients")
                
                Divider()
                
                MealDisclosureGroupView(revealDisclosure: $controller.revealMesurement, items: meal.collectMesurements(), title: "Mesurements")
                
                Divider()
                
                if (meal.strYoutube != nil || meal.strYoutube!.isEmpty) || (meal.strSource != nil || meal.strSource!.isEmpty) {
                    VStack {
                        Text("See this:")
                            .frame(maxWidth: .infinity, alignment: .leading)
                        HStack {
                            if meal.strYoutube != nil || meal.strYoutube!.isEmpty {
                                WebLinkButtonView("Youtube!", meal.strYoutube!)
                            }
                            if meal.strSource != nil || meal.strSource!.isEmpty {
                                WebLinkButtonView("Recipe Source", meal.strSource!)
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
            .padding(.horizontal)
        }
        .navigationTitle(meal.strMeal)
        .toolbar {
            ToolbarItem {
                Button {
                    if isInWishlist {
                        deleteFromWishlist()
                    } else {
                        saveInWishlist()
                    }
                } label: {
                    if isInWishlist {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.red)
                    } else {
                        Image(systemName: "heart")
                    }
                }
            }
        }
        .onAppear {
            updateIsInWishlist()
        }
    }
    
    
    func saveInWishlist() -> Void {
        model.save(WishlistItem.init(
            id: meal.idMeal,
            name: meal.strMeal,
            thumb: meal.strMealThumb
        ))
        
        updateIsInWishlist()
    }
    
    func deleteFromWishlist() -> Void {
        model.delete(WishlistItem.init(
            id: meal.idMeal,
            name: meal.strMeal,
            thumb: meal.strMealThumb
        ))
        
        updateIsInWishlist()
    }
    
    func updateIsInWishlist() -> Void {
        self.isInWishlist = model.getById(meal.idMeal) != nil
    }
}
