//
//  ViewController.swift
//  PokemonLib
//
//  Created by Артур on 16.10.23.
//

import UIKit

class MainViewController: UIViewController, MainViewProtocol {
    
    static let identifier = "MainViewController"
    
    private var pokemonItemArray = [PokemonDetailsItem]()
    
    private var pokemonArray = [PokemonPreviewModel]()
    
    private var response: APIResponseModel?
    
    var presenter: MainPresenterProtocol?

    @IBOutlet weak var loadMoreButton: UIButton!
    @IBOutlet weak var pokemonTableView: UITableView!
    @IBOutlet weak var MainHeaderView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        let alert = UIAlertController(title: "Load data from: ", message: "", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Network", style: .default, handler: { _ in
            self.presenter?.getPokemonList()
        }))
        alert.addAction(UIAlertAction(title: "Database", style: .default, handler: { _ in
            self.fetchDataFromDatabase()
            self.loadMoreButton.isHidden = true
            self.reloadTable()
        }))
        self.present(alert, animated: true)
        
        pokemonTableView.delegate = self
        pokemonTableView.dataSource = self
    }
    
    func fetchDataFromDatabase() {
        CoreDataManager.shared.fetchItemsFromDatabase { [weak self] result in
            switch result {
            case .success(let pokemonItems):
                self?.pokemonItemArray = pokemonItems
                self?.reloadTable()
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func reloadTable() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else {return}
            self.pokemonTableView.reloadData()
        }
    }

    func showList(response: APIResponseModel) {
        self.response = response
        if let pokemons = response.results {
            self.pokemonArray.append(contentsOf: pokemons)
            self.reloadTable()
        }
    }
    
    func showError(error: Error) {
        
        showAlert(error: error)
    }
    
    func showAlert(error: Error) {
        let alert = UIAlertController(title: "Something went wrong", message: "You are not connected Internet. \n Load data from local storage?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { action in
            self.fetchDataFromDatabase()
            self.reloadTable()
        }))
        self.present(alert, animated: true)
    }

    @IBAction func loadMoreButtonClicked(_ sender: Any) {
        presenter?.getNextPage(urlString: response?.next)
    }
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count == 0 ? pokemonItemArray.count : pokemonArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier) as? MainTableViewCell else {return UITableViewCell()}
        if pokemonArray.count != 0 {
            cell.configure(pokemonArray[indexPath.row])
        } else {
            cell.configure(pokemonItemArray[indexPath.row])
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let navController = navigationController!
        
        if pokemonArray.count != 0, let url = pokemonArray[indexPath.row].url {
            presenter?.showDetailViewController(navigationController: navController, pokemonUrl: url)
        } else {
            presenter?.showDetailViewController(navigationController: navController, pokemonItem: pokemonItemArray[indexPath.row])
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
