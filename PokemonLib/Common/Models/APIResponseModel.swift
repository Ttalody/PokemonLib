//
//  APIResponseModel.swift
//  PokemonLib
//
//  Created by Артур on 16.10.23.
//

import Foundation

struct APIResponseModel: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [PokemonPreviewModel]?
    
    private enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
}
