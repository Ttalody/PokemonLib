//
//  PokemonSprites.swift
//  PokemonLib
//
//  Created by Артур on 16.10.23.
//

import Foundation

struct PokemonSprites: Codable {
    let frontDefault: String?
    
    private enum CodingKeys: String, CodingKey {
        case frontDefault = "front_default"
    }
}
