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
    
    func responseResult(response: APIResponseModel?, error: Error?) {
        if let response = response {
            self.vc?.showList(response: response)
        } else if let error = error {
            
            self.vc?.showError(error: error)
        }
    }
    
    func getNextPage(urlString: String?) {
        interactor?.requestNextPage(urlSting: urlString)
    }
    
    func showDetailViewController(navigationController: UINavigationController, pokemonUrl: String) {
        router?.pushDetailViewController(navigationController: navigationController, pokemonUrl: pokemonUrl)
    }
    
    func showDetailViewController(navigationController: UINavigationController, pokemonItem: PokemonDetailsItem) {
        router?.pushDetailViewController(navigationController: navigationController, pokemonItem: pokemonItem)
    }

}
