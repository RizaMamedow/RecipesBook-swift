//
//  MealThumbnailView.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 16.08.2024.
//

import SwiftUI

struct MealThumbnailView: View {
    var thumbnailUrl: String
    
    init(_ thumbnailUrl: String) {
        self.thumbnailUrl = thumbnailUrl
    }
    
    var body: some View {
        AsyncImage(url: URL(string: thumbnailUrl)) { image in
            image.resizable()
        } placeholder: {
            Rectangle()
                .background(.ultraThickMaterial)
        }
        .frame(height: 300)
        .clipShape(.rect(cornerRadius: 25))
        .shadow(radius: 5)
    }
}

#Preview {
    MealThumbnailView("https://www.themealdb.com/images/media/meals/wvpsxx1468256321.jpg")
}
