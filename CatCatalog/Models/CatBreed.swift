//
//  CatBreed.swift
//  CatCatalog
//
//  Created by Adolfo Gerard Montilla Gonzalez on 04-02-25.
//

import Foundation

struct CatBreed: Decodable {
    // Computed properties to easily access the breed details from the first element.
    // If the breeds array is empty, these properties return empty strings.
    var id: String {
        breeds.first?.id ?? ""
    }
    var name: String {
        breeds.first?.name ?? ""
    }
    var description: String {
        breeds.first?.description ?? ""
    }
    var origin: String {
        breeds.first?.origin ?? ""
    }
    var referenceImageId: String {
        breeds.first?.referenceImageId ?? ""
    }
    
    // The underlying array decoded from the "breeds" key.
    private var breeds: [Breed]
    
    // The nested structure that represents each breed.
    struct Breed: Decodable {
        let id: String
        let name: String
        let description: String
        let origin: String
        let referenceImageId: String
        
        // Map JSON keys to our property names.
        private enum CodingKeys: String, CodingKey {
            case id
            case name
            case description
            case origin
            case referenceImageId = "reference_image_id"
        }
    }

    private enum CodingKeys: String, CodingKey {
        case breeds
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.breeds = try container.decode([Breed].self, forKey: .breeds)
    }
}
