//
//  ViewController.swift
//  PokemonLib
//
//  Created by Артур on 16.10.23.
//

import UIKit

class MainViewController: UIViewController {
    
    var pokemonArray = [PokemonPreviewModel]()

    @IBOutlet weak var pokemonTableView: UITableView!
    @IBOutlet weak var MainHeaderView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
        
        NetworkManager.makeRequest { result in
            switch result {
            case .success(let response):
                self.pokemonArray.append(contentsOf: response?.results ?? [PokemonPreviewModel]())
                reloadTable()
            case .failure(let error):
                print(error)
            }
        }
        
        func reloadTable() {
            DispatchQueue.main.async { [weak self] in
                guard let self = self else {return}
                self.pokemonTableView.reloadData()
            }
        }
    }


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        pokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier) as? MainTableViewCell else {return UITableViewCell()}
        cell.configure(pokemonArray[indexPath.row])
        return cell
    }
    
    
}
