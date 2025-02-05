//
//  TestData.swift
//  CatCatalog
//
//  Created by Adolfo Gerard Montilla Gonzalez on 04-02-25.
//

import Foundation

let testCat: Data = """
{
    "id":"ebv",
    "url":"https://cdn2.thecatapi.com/images/ebv.jpg",
    "width":176,
    "height":540
}
""".data(using: .utf8)!

let testCatsData: Data = """
    [
        {
            "id": "16r",
            "url": "https://cdn2.thecatapi.com/images/16r.jpg",
            "width": 640,
            "height": 427
        },
        {
            "id": "24g",
            "url": "https://cdn2.thecatapi.com/images/24g.jpg",
            "width": 500,
            "height": 325
        },
        {
            "id": "385",
            "url": "https://cdn2.thecatapi.com/images/385.jpg",
            "width": 400,
            "height": 600
        }
    ]
    """.data(using: .utf8)!


let testCatBreed = """
    {
        "breeds": [
            {
                "weight": {
                    "imperial": "6 - 12",
                    "metric": "3 - 7"
                },
                "id": "beng",
                "name": "Bengal",
                "cfa_url": "http://cfa.org/Breeds/BreedsAB/Bengal.aspx",
                "vetstreet_url": "http://www.vetstreet.com/cats/bengal",
                "vcahospitals_url": "https://vcahospitals.com/know-your-pet/cat-breeds/bengal",
                "temperament": "Alert, Agile, Energetic, Demanding, Intelligent",
                "origin": "United States",
                "country_codes": "US",
                "country_code": "US",
                "description": "Bengals are a lot of fun to live with, but they're definitely not the cat for everyone, or for first-time cat owners. Extremely intelligent, curious and active, they demand a lot of interaction and woe betide the owner who doesn't provide it.",
                "life_span": "12 - 15",
                "indoor": 0,
                "lap": 0,
                "adaptability": 5,
                "affection_level": 5,
                "child_friendly": 4,
                "cat_friendly": 4,
                "dog_friendly": 5,
                "energy_level": 5,
                "grooming": 1,
                "health_issues": 3,
                "intelligence": 5,
                "shedding_level": 3,
                "social_needs": 5,
                "stranger_friendly": 3,
                "vocalisation": 5,
                "bidability": 3,
                "experimental": 0,
                "hairless": 0,
                "natural": 0,
                "rare": 0,
                "rex": 0,
                "suppressed_tail": 0,
                "short_legs": 0,
                "wikipedia_url": "https://en.wikipedia.org/wiki/Bengal_(cat)",
                "hypoallergenic": 1,
                "reference_image_id": "O3btzLlsO"
            }
        ],
        "id": "J2PmlIizw",
        "url": "https://cdn2.thecatapi.com/images/J2PmlIizw.jpg",
        "width": 1080,
        "height": 1350
    }
    """.data(using: .utf8)!

