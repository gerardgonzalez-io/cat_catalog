//
//  CatError.swift
//  CatCatalog
//
//  Created by Adolfo Gerard Montilla Gonzalez on 04-02-25.
//

import Foundation

enum CatError: Error {
    case missingData
    case networkError
    case unexpectedError(error: Error)
}

extension CatError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Discarding a cat information missing a valid id, url, width, or height.", comment: "")
        case .networkError:
            return NSLocalizedString("Error fetching data over the network.", comment: "")
        case .unexpectedError(let error):
            return NSLocalizedString("Received unexpected error. \(error.localizedDescription)", comment: "")
        }
    }
}
