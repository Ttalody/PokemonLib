//
//  DetailInteractor.swift
//  PokemonLib
//
//  Created by Артур on 18.10.23.
//

import UIKit

class DetailInteractor: DetailInteractorProtocol {
    
    weak var presenter: DetailPresenterProtocol?
    
    func requestPokemonData() {
        print("requestPokemonData")
    }
}
