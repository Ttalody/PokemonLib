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
    
    func getPokemonData() {
        print("getPokemonData")
    }
    
    func responseResult(pokemons: [PokemonResponseModel]?, error: Error?) {
        print("responseResult")
    }
}
