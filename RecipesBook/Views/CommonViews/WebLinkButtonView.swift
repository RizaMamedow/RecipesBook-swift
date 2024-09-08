//
//  WebLinkButtonView.swift
//  RecipesBook
//
//  Created by Riza Mamedov on 16.08.2024.
//

import SwiftUI

struct WebLinkButtonView: View {
    @Environment(\.openURL) var openURL
    
    var url: String
    var label: String
    
    init(_ label: String, _ url: String) {
        self.url = url
        self.label = label
    }
    
    var body: some View {
        Button{
            openURL(URL(string: url)!)
        } label: {
            Text(label)
        }
    }
}
