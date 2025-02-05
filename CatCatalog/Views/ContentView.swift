//
//  ContentView.swift
//  CatCatalog
//
//  Created by Adolfo Gerard Montilla Gonzalez on 03-02-25.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var provider: CatsProvider
    @State private var isLoading = false
    @State private var error: CatError?
    @State private var hasError = false
    
    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(provider.cats) { cat in
                        
                        NavigationLink {
                            CatDetail(cat: cat)
                        } label: {
                            CatCardView(cat: cat)
                                .transition(.slide)
                        }
                    }
                }
                .padding()
            }
            .refreshable {
                await fetchCats()
            }
            .navigationTitle("🐱 Cat Catalog")
        }
        .task {
            await fetchCats()
        }
        .alert(isPresented: $hasError) {
            Alert(title: Text("Error"), message: Text(error?.localizedDescription ?? "Something went wrong"), dismissButton: .default(Text("OK")))
        }
    }
    
    private func fetchCats() async {
        isLoading = true
        do {
            try await provider.fetchCats()
        } catch {
            self.error = error as? CatError ?? .unexpectedError(error: error)
            self.hasError = true
        }
        isLoading = false
    }
}

#Preview {
    ContentView()
        .environmentObject(CatsProvider(client: CatClient(downloader: TestDownloader())))
}

