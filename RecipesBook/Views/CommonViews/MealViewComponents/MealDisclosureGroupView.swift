//
//  MealDisclosureGroupView.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 16.08.2024.
//

import SwiftUI

struct MealDisclosureGroupView: View {
    @Binding var revealDisclosure: Bool
    var items: [String]
    var title: String
    
    var body: some View {
        DisclosureGroup(isExpanded: $revealDisclosure) {
            VStack {
                ForEach(items, id: \.self) { item in
                    HStack {
                        Text("\(item)")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
        } label: {
            HStack(alignment: .firstTextBaseline) {
                Text(title)
                    .font(.title2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}
