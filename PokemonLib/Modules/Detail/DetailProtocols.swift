//
//  DetailProtocols.swift
//  PokemonLib
//
//  Created by Артур on 18.10.23.
//

import UIKit

protocol DetailViewProtocol: AnyObject {
    var presenter: DetailPresenterProtocol? { get set }
    
    func setupVC(pokemonModel: PokemonResponseModel?)
    
    func configure(with url: String)
}

protocol DetailInteractorProtocol: AnyObject {
    var presenter: DetailPresenterProtocol? {get set}
    
    func requestPokemonData(with url: String)
}

protocol DetailPresenterProtocol: AnyObject {
    var vc: DetailViewProtocol? { get set }
    var interactor: DetailInteractorProtocol? { get set }
    var router: DetailRouterProtocol? { get set }
    
    func getPokemonData(url: String)
    func responseResult(pokemon: PokemonResponseModel?, error: Error?)
}

protocol DetailRouterProtocol: AnyObject {
    var presenter: DetailPresenterProtocol? {get set}
    
    static func createModule() -> DetailViewController
    
    func closeCurrentViewController()
}
