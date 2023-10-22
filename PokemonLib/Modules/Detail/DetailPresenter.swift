//
//  DetailPresenter.swift
//  PokemonLib
//
//  Created by Артур on 18.10.23.
//

import UIKit

class DetailPresenter: DetailPresenterProtocol {
    
    weak var vc: DetailViewProtocol?
    var interactor: DetailInteractorProtocol?
    var router: DetailRouterProtocol?
    
    func getPokemonData(url: String) {
        interactor?.requestPokemonData(with: url)
    }
    
    func responseResult(pokemon: PokemonResponseModel?, error: Error?) {
        vc?.setupVC(pokemonModel: pokemon)
    }
}
