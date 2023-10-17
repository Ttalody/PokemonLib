//
//  ViewController.swift
//  PokemonLib
//
//  Created by Артур on 16.10.23.
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {
    
    static let identifier = "MainViewController"
    
    private var pokemonArray = [PokemonPreviewModel]()
    
    var presenter: MainPresenterProtocol?

    @IBOutlet weak var pokemonTableView: UITableView!
    @IBOutlet weak var MainHeaderView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.getPokemonList()
        
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
    }
    
    func reloadTable() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.pokemonTableView.reloadData()
        }
    }

    func showList(pokemons: [PokemonPreviewModel]) {
        self.pokemonArray.append(contentsOf: pokemons)
        self.reloadTable()
    }
    
    func showError(error: Error) {
        print(error)
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
