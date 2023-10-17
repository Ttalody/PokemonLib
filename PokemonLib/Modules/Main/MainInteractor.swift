//
//  MainInteractor.swift
//  PokemonLib
//
//  Created by Артур on 16.10.23.
//

import UIKit

class MainInteractor: MainInteractorProtocol {
    
    weak var presenter: MainPresenterProtocol?
    
    func requestPokemonList() {
        NetworkManager.makeRequest { result in
            switch result {
            case .success(let response): print("api request success")
                self.presenter?.responseResult(pokemons: response?.results, error: nil)
            case .failure(let error): self.presenter?.responseResult(pokemons: nil, error: error)
                print("api request failure")
            }
        }
    }
}
