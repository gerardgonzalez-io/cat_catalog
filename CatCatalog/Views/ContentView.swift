//
//  ContentView.swift
//  CatCatalog
//
//  Created by Adolfo Gerard Montilla Gonzalez on 03-02-25.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var provider: CatsProvider
    @State var isLoading = false
    @State private var error: CatError?
    @State private var hasError = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(provider.cats) { cat in
                    HStack(spacing: 16) {
                        // Load and display the image from the URL
                        AsyncImage(url: cat.url) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFill()
                            } else if phase.error != nil {
                                // In case of an error, display a red rectangle
                                Color.red
                            } else {
                                // While the image is loading, show a progress indicator
                                ProgressView()
                            }
                        }
                        .frame(width: 100, height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .clipped()
                        
                        // Display the cat's id
                        Text(cat.id)
                            .font(.headline)
                    }
                    .padding(.vertical, 8)
                }
                .onDelete(perform: deleteCats)
            }
            .listStyle(.inset)
            .navigationTitle("Cats")
            .refreshable {
                do {
                    try await provider.fetchCats()
                } catch {
                    self.error = CatError.missingData
                    hasError = true
                }
            }
        }
        .padding()
        .task {
            try? await provider.fetchCats()
        }
    }
}

extension ContentView {
    
    func fetchQuakes() async {
        isLoading = true
        do {
            try await provider.fetchCats()
        } catch {
            self.error = error as? CatError ?? .unexpectedError(error: error)
            self.hasError = true
        }
        isLoading = false
    }

    func deleteCats(at offsets: IndexSet) {
        provider.deleteCats(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
        .environmentObject(CatsProvider(client: CatClient(downloader: TestDownloader())))
}


