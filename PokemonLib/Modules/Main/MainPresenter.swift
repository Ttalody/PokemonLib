//
//  MainPresenter.swift
//  PokemonLib
//
//  Created by Артур on 16.10.23.
//

import UIKit

class MainPresenter: MainPresenterProtocol {
    
    weak var vc: MainViewProtocol?
    
    var interactor: MainInteractorProtocol?
    
    var router: MainRouterProtocol?
    
    func getPokemonList() {
        interactor?.requestPokemonList()
    }
    
    func responseResult(pokemons: [PokemonPreviewModel]?, error: Error?) {
        if let pokemons = pokemons {
            self.vc?.showList(pokemons: pokemons)
        } else if let error = error {
            self.vc?.showError(error: error)
        }
    }
    
    func showDetailViewController(navigationController: UINavigationController, pokemonUrl: String) {
        router?.pushDetailViewController(navigationController: navigationController, pokemonUrl: pokemonUrl)
    }
}
