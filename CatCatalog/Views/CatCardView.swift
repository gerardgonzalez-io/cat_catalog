//
//  CatCardView.swift
//  CatCatalog
//
//  Created by Adolfo Gerard Montilla Gonzalez on 05-02-25.
//

import SwiftUI

struct CatCardView: View {
    let cat: Cat
    
    var body: some View {
        VStack {
            AsyncImage(url: cat.url) { phase in
                switch phase {
                case .empty:
                    // Placeholder while loading
                    ProgressView()
                        .frame(height: 200)
                        .frame(maxWidth: .infinity)
                        .background(Color.gray.opacity(0.2))
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                case .success(let image):
                    // Successfully loaded image
                    image
                        .resizable()
                        .scaledToFit()
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                        .shadow(radius: 5)
                case .failure:
                    // Graceful fallback image
                    VStack {
                        Image(systemName: "photo.on.rectangle.angled")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80, height: 80)
                            .foregroundColor(.gray)
                        Text("Image not available")
                            .font(.footnote)
                            .foregroundColor(.gray)
                    }
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .background(Color.gray.opacity(0.1))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .onTapGesture {
                        // Retry action
                    }
                @unknown default:
                    EmptyView()
                }
            }
        }
        .padding()
    }
}

#Preview {
    CatCardView(cat: Cat(
        id: "1",
        url: URL(string: "https://example.com/cat.jpg")!,
        width: 800,
        height: 600,
        breed: nil
    ))
}
