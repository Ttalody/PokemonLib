//
//  MainProtocols.swift
//  PokemonLib
//
//  Created by Артур on 16.10.23.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    
    var presenter: MainPresenterProtocol? { get set }
    
    func showList(pokemons: [PokemonPreviewModel])
    
    func showError(error: Error)
}

protocol MainInteractorProtocol: AnyObject {
    
    var presenter: MainPresenterProtocol? {get set}
    
    func requestPokemonList()
}

protocol MainPresenterProtocol: AnyObject {
    
    var vc: MainViewProtocol? {get set}
    var interactor: MainInteractorProtocol? {get set}
    var router: MainRouterProtocol? {get set}
    
    func getPokemonList()
    
    func responseResult(pokemons: [PokemonPreviewModel]?, error: Error?)
}

protocol MainRouterProtocol: AnyObject {
    
    var presenter: MainPresenterProtocol? {get set}
    
    static func createModule() -> MainViewController
    
}
