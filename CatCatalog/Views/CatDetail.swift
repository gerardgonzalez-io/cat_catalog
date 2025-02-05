//
//  CatDetail.swift
//  CatCatalog
//
//  Created by Adolfo Gerard Montilla Gonzalez on 05-02-25.
//

import SwiftUI

struct CatDetail: View {
    var cat: Cat
    
    var body: some View {
        
        ScrollView {
            
            MapView()
                .frame(height: 300)
            
            CircleImage(imageURL: cat.url)
                .offset(y: -130)
                .padding(.bottom, -130)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(cat.breed?.name ?? "Unknown Breed")
                        .font(.title)
                }
                HStack {
                    Spacer()
                }
                .font(.subheadline)
                .foregroundStyle(.secondary)

                Divider()
                
                Text("About \(cat.breed?.name ?? "Unknown Breed")")
                                    .font(.title2)
                
                Text(cat.breed?.description ?? "No description available.")
            }
            .padding()
        }
        .navigationTitle(cat.breed?.name ?? "Cat Detail")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CatDetail(cat: Cat(
        id: "12345",
        url: URL(string: "https://example.com/cat.jpg")!,
        width: 800,
        height: 600,
        breed: nil)
    )
}

