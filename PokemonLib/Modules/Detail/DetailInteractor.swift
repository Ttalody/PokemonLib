//
//  DetailInteractor.swift
//  PokemonLib
//
//  Created by Артур on 18.10.23.
//

import UIKit

class DetailInteractor: DetailInteractorProtocol {
    
    weak var presenter: DetailPresenterProtocol?
    
    func requestPokemonData(with url: String) {
        NetworkManager.makePokemonRequest(url: url) { result in
            switch result {
            case .success(let pokemonResponse):
                DispatchQueue.main.async {
                    self.presenter?.responseResult(pokemon: pokemonResponse, error: nil)

                }
            case.failure(let error): print("Error: \(error.localizedDescription)")
            }
        }
    }
    
}
