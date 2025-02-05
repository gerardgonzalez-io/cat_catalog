//
//  CatManagment.swift
//  CatCatalog
//
//  Created by Adolfo Gerard Montilla Gonzalez on 04-02-25.
//

import Foundation

struct CatManagement: Decodable {
    private(set) var cats: [Cat] = []
    
    init(from decoder: Decoder) throws {
        // Since the JSON is a top-level array, use an unkeyed container.
        var container = try decoder.unkeyedContainer()

        while !container.isAtEnd {
            let cat = try container.decode(Cat.self)
            cats.append(cat)
        }
    }
}
