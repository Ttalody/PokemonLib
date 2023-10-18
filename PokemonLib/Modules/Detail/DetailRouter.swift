//
//  DetailRouter.swift
//  PokemonLib
//
//  Created by Артур on 18.10.23.
//

import UIKit

class DetailRouter: DetailRouterProtocol {
    weak var presenter: DetailPresenterProtocol?
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createModule() -> DetailViewController {
        let vc = mainStoryboard.instantiateViewController(withIdentifier: DetailViewController.identifier) as! DetailViewController
        
        let presenter: DetailPresenterProtocol = DetailPresenter()
        let interactor: DetailInteractorProtocol = DetailInteractor()
        let router: DetailRouterProtocol = DetailRouter()
        
        vc.presenter = presenter
        presenter.vc = vc
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.presenter = presenter
        
        return vc
    }
    
    func closeCurrentViewController() {
        print("closeCurrentViewController")
    }
}
