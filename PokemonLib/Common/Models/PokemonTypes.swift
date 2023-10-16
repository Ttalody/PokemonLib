//
//  PokemonTypes.swift
//  PokemonLib
//
//  Created by Артур on 16.10.23.
//

import Foundation

struct PokemonTypes: Codable {
    let type: PokemonType?
    
    private enum CodingKeys: String, CodingKey {
        case type
    }
}
