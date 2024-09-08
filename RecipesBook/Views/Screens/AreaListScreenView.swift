//
//  AreaListViewScreen.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 20.08.2024.
//

import SwiftUI

struct AreaListScreenView: View {
    @StateObject var controller: AreaListController = .init()
    
    var body: some View {
        NavigationStack {
            VStack {
                if (controller.isLoaded) {
                    if(controller.areaList != nil) {
                        List(controller.areaList!.meals, id: \.strArea){ element in
                            NavigationLink {
                                AreaMealsScreenView(area: element.strArea)
                            } label: {
                                Text(element.strArea)
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
    AreaListScreenView()
}
