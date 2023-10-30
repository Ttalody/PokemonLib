//
//  PokemonResponseModel.swift
//  PokemonLib
//
//  Created by Артур on 16.10.23.
//

import Foundation

struct PokemonResponseModel: Codable {
    let id: Int?
    let name: String?
    let sprites: PokemonSprites
    let pokemonTypes: [PokemonTypes]?
    let height: Int?
    let weight: Int?
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case sprites
        case pokemonTypes = "types"
        case height
        case weight
    }
        
    init(id: Int, name: String, sprites: PokemonSprites, pokemonTypes: [PokemonTypes], height: Int, weight: Int){
        self.id = id
        self.name = name
        self.sprites = sprites
        self.pokemonTypes = pokemonTypes
        self.height = height
        self.weight = weight
    }
}
