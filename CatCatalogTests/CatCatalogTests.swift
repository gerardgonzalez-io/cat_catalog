//
//  CatCatalogTests.swift
//  CatCatalogTests
//
//  Created by Adolfo Gerard Montilla Gonzalez on 04-02-25.
//

import XCTest
@testable import CatCatalog

final class CatCatalogTests: XCTestCase {

    func testDecodesCat() throws {
        let decoder = JSONDecoder()
        let cat = try decoder.decode(Cat.self, from: testCat)

        XCTAssertEqual(cat.id, "ebv")
    }

    func testCatManagementDecodesCats() throws {
        let decoder = JSONDecoder()

        let decoded = try decoder.decode(CatManagement.self, from: testCatsData)
        
        // Check that three cats were decoded
        XCTAssertEqual(decoded.cats.count, 3)
        
        // Verify that the first cat has the expected id and other properties
        let firstCat = decoded.cats[0]
        XCTAssertEqual(firstCat.id, "16r")
        XCTAssertEqual(firstCat.width, 640)
        XCTAssertEqual(firstCat.height, 427)
        XCTAssertEqual(firstCat.url.absoluteString, "https://cdn2.thecatapi.com/images/16r.jpg")
    }
    
    func testCatBreedDecoder() throws {
        let decoded = try JSONDecoder().decode(CatBreed.self, from: testCatBreed)
        XCTAssertEqual(decoded.id, "beng")
    }
    
    func testClientDoesFetchEarthquakeData() async throws {
        let downloader = TestDownloader()
        let client = CatClient(downloader: downloader)
        let cats = try await client.cats

        XCTAssertEqual(cats.count, 3)
    }
}
