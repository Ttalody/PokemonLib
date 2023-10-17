//
//  MainRouter.swift
//  PokemonLib
//
//  Created by Артур on 16.10.23.
//

import UIKit

class MainRouter: MainRouterProtocol {
    
    weak var presenter: MainPresenterProtocol?
    
    static var mainStoryboard: UIStoryboard {
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    static func createModule() -> MainViewController {
        let vc = mainStoryboard.instantiateViewController(withIdentifier: MainViewController.identifier) as! MainViewController
        
        let presenter: MainPresenterProtocol = MainPresenter()
        let interactor: MainInteractorProtocol = MainInteractor()
        let router: MainRouterProtocol = MainRouter()
        
        print("createModule")
        
        vc.presenter = presenter
        presenter.vc = vc
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        router.presenter = presenter
        
        return vc
    }
    
    func openDetailViewController(at indexPath: IndexPath) {
        print("openDetailViewController")
    }
}
