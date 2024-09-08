//
//  ErrorView.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 10.08.2024.
//

import SwiftUI

struct ErrorView: View {
    @State var errorMessage: String
    
    init(_ errorMessage: String = "Something broken") {
        self.errorMessage = errorMessage
    }
    
    var body: some View {
        VStack {
            Image(systemName: "xmark.octagon")
                .font(.system(size: 50))
                .padding(.bottom, 1)
            Text(errorMessage)
                .font(.headline)
        }
        .foregroundStyle(.red)
    }
}

#Preview {
    ErrorView("Example Message")
}
