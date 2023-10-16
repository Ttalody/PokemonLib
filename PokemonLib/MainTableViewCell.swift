//
//  MainTableViewCell.swift
//  PokemonLib
//
//  Created by Артур on 16.10.23.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let identifier = "MainTableViewCell"

    @IBOutlet weak var cellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func configure(_ pokemon: PokemonPreviewModel) {
        cellLabel.text = pokemon.name?.capitalized
    }
}
