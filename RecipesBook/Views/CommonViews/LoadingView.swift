//
//  LoadingView.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 10.08.2024.
//

import SwiftUI

struct LoadingView: View {
    @State private var loadingTexts: [String] = [".", "..", "...", "...."]
    @State private var textIndex: Int = 0
    var body: some View {
        VStack {
            ProgressView()
                .scaleEffect(1.5)
                .padding(.bottom, 4)
            Text("Waiting please" + loadingTexts[textIndex])
                .foregroundStyle(.gray)
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
               self.textIndex = (self.textIndex + 1) % self.loadingTexts.count
            }
        }
    }
}

#Preview {
    LoadingView()
}
