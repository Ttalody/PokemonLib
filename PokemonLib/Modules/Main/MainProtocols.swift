//
//  MainProtocols.swift
//  PokemonLib
//
//  Created by Артур on 16.10.23.
//

import UIKit

protocol MainViewProtocol: AnyObject {
    
    var presenter: MainPresenterProtocol? { get set }
    
    func showList(response: APIResponseModel)
    
    func showError(error: Error)
}

protocol MainInteractorProtocol: AnyObject {
    
    var presenter: MainPresenterProtocol? {get set}
    
    func requestPokemonList()
    
    func requestNextPage(urlSting: String?)
}

protocol MainPresenterProtocol: AnyObject {
    
    var vc: MainViewProtocol? {get set}
    var interactor: MainInteractorProtocol? {get set}
    var router: MainRouterProtocol? {get set}
    
    func getPokemonList()
    
    func getNextPage(urlString: String?)
    
    func responseResult(response: APIResponseModel?, error: Error?)
    
    func showDetailViewController(navigationController: UINavigationController, pokemonUrl: String)
    
    func showDetailViewController(navigationController: UINavigationController, pokemonItem: PokemonDetailsItem)
}

protocol MainRouterProtocol: AnyObject {
    
    var presenter: MainPresenterProtocol? {get set}
    
    static func createModule() -> MainViewController
    
    func pushDetailViewController(navigationController: UINavigationController, pokemonUrl: String)
    
    func pushDetailViewController(navigationController: UINavigationController, pokemonItem: PokemonDetailsItem)
}
