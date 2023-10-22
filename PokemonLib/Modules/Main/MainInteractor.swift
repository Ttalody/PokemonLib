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
            case .success(let response):
                self.presenter?.responseResult(response: response, error: nil)
            case .failure(let error): self.presenter?.responseResult(response: nil, error: error)
            }
        }
    }
    
    func requestNextPage(urlSting: String?) {
        NetworkManager.makePageRequest(urlString: urlSting) { result in
            switch result {
            case .success(let response):
                self.presenter?.responseResult(response: response, error: nil)
            case .failure(let error): self.presenter?.responseResult(response: nil, error: error)
            }
        }
    }
}
