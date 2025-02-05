//
//  CatClient.swift
//  CatCatalog
//
//  Created by Adolfo Gerard Montilla Gonzalez on 04-02-25.
//

import Foundation

class CatClient {


    var cats: [Cat] {
        get async throws {
            let data = try await downloader.httpData(from: feedURL)
            let allCats = try decoder.decode(CatManagement.self, from: data)
            return allCats.cats
        }
    }


    private lazy var decoder: JSONDecoder = {
        let aDecoder = JSONDecoder()
        aDecoder.dateDecodingStrategy = .millisecondsSince1970
        return aDecoder
    }()


    private let feedURL = URL(string: "https://api.thecatapi.com/v1/images/search?limit=15&api_key=live_SQrKLNbe12gr9OSkTaU6eBiprDvlXeD8Hxenf01Sfl6zyEMyOwmylA2bWoCx2efT&")!


    private let downloader: any HTTPDataDownloader


    init(downloader: any HTTPDataDownloader = URLSession.shared) {
        self.downloader = downloader
    }
}
