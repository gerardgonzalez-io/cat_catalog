//
//  CatProvider.swift
//  CatCatalog
//
//  Created by Adolfo Gerard Montilla Gonzalez on 04-02-25.
//

import Foundation

@MainActor
class CatsProvider: ObservableObject {


    @Published var cats: [Cat] = []


    let client: CatClient


    func fetchCats() async throws {
        let latestCats = try await client.cats
        self.cats = latestCats
    }


    func deleteCats(atOffsets offsets: IndexSet) {
        cats.remove(atOffsets: offsets)
    }


    init(client: CatClient = CatClient()) {
        self.client = client
    }
}
