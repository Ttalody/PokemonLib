//
//  DetailViewController.swift
//  PokemonLib
//
//  Created by Артур on 18.10.23.
//

import UIKit

class DetailViewController: UIViewController, DetailViewProtocol {
    
    var presenter: DetailPresenterProtocol?
    
    var pokemonUrl: String = String()
    
    static let identifier = "DetailViewController"
    
    @IBOutlet weak var pokemonImageView: UIImageView!
    @IBOutlet weak var pokemonWeightLabel: UILabel!
    @IBOutlet weak var pokemonHeightLabel: UILabel!
    @IBOutlet weak var pokemonTypeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
        
    func setupVC(pokemonModel: PokemonResponseModel?) {
        guard let pokemon = pokemonModel,
              let name = pokemon.name,
              let type = pokemon.pokemonTypes?[0].type?.name,
              let imageUrl = pokemon.sprites.frontDefault,
              let height = pokemon.height,
              let weight = pokemon.weight else {return}
        self.navigationItem.title = name.capitalized
        self.pokemonHeightLabel.text = "Height: \(String(height * 10)) cm"
        self.pokemonTypeLabel.text = "Type: " + type.capitalized
        self.pokemonWeightLabel.text = "Weight: \(String(Double(weight) / 10)) kg"
        NetworkManager.downloadImage(url: imageUrl) { image in
            self.pokemonImageView.image = image
        }
    }
    
    func configure(with url: String) {
        presenter?.getPokemonData(url: url)
    }
    
}
