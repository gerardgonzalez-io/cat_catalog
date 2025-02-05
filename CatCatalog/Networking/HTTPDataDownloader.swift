//
//  HTTPDataDownloader.swift
//  CatCatalog
//
//  Created by Adolfo Gerard Montilla Gonzalez on 04-02-25.
//

import Foundation

let validStatus = 200...299
/// A protocol describing an HTTP Data Downloader.
protocol HTTPDataDownloader {
    func httpData(from: URL) async throws -> Data
}

extension URLSession: HTTPDataDownloader {
    func httpData(from url: URL) async throws -> Data {
        guard let (data, response) = try await self.data(from: url, delegate: nil) as? (Data, HTTPURLResponse),
              validStatus.contains(response.statusCode) else {
            throw CatError.networkError
        }
        return data
    }
}
