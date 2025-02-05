//
//  CircleImage.swift
//  CatCatalog
//
//  Created by Adolfo Gerard Montilla Gonzalez on 05-02-25.
//

import SwiftUI

import SwiftUI

struct CircleImage: View {
    var imageURL: URL
    
    var body: some View {
        AsyncImage(url: imageURL) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
            } else {
                Image(systemName: "photo") // Placeholder icon
                    .resizable()
                    .scaledToFit()
                    .foregroundColor(.gray)
            }
        }
        .frame(width: 150, height: 150)
        .clipShape(Circle())
        .overlay(Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 7)
    }
}

#Preview {
    CircleImage(imageURL: URL(string: "https://example.com/cat.jpg")!)
}


