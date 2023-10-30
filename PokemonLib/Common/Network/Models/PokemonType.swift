//
//  PokemonType.swift
//  PokemonLib
//
//  Created by Артур on 16.10.23.
//

import Foundation

struct PokemonType: Codable {
    let name: String?
    
    private enum CodingKeys: String, CodingKey {
        case name
    }
}
