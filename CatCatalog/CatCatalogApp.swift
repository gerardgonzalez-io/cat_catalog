//
//  CatCatalogApp.swift
//  CatCatalog
//
//  Created by Adolfo Gerard Montilla Gonzalez on 03-02-25.
//

import SwiftUI

@main
struct CatCatalogApp: App {
    @StateObject var catsProvider = CatsProvider()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(catsProvider)
        }
    }
}
