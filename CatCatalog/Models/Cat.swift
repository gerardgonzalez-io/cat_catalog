//
//  Cat.swift
//  CatCatalog
//
//  Created by Adolfo Gerard Montilla Gonzalez on 04-02-25.
//

import Foundation

struct Cat: Identifiable {
    let id: String
    let url: URL
    let width: Int
    let height: Int
    var breed: CatBreed?
}

extension Cat: Decodable {
    private enum CodingKeys: String, CodingKey {
        case id
        case url
        case width
        case height
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let rawId = try? container.decode(String.self, forKey: .id)
        let rawUrl = try? container.decode(URL.self, forKey: .url)
        let rawWidth = try? container.decode(Int.self, forKey: .width)
        let rawHeight = try? container.decode(Int.self, forKey: .height)

        guard let id = rawId,
              let url = rawUrl,
              let width = rawWidth,
              let height = rawHeight else {
            throw CatError.missingData
        }

        self.id = id
        self.url = url
        self.width = width
        self.height = height
    }
}

