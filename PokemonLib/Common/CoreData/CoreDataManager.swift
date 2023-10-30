//
//  CoreDataManager.swift
//  PokemonLib
//
//  Created by Артур on 23.10.23.
//

import Foundation
import UIKit

class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    func addItem(with model: PokemonResponseModel, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let context =  appDelegate.persistentContainer.viewContext
        
        let pokemonDetails = PokemonDetailsItem(context: context)
        
        pokemonDetails.name = model.name
        pokemonDetails.type = model.pokemonTypes![0].type!.name
        pokemonDetails.height = Int64(model.height!)
        pokemonDetails.weight = Int64(model.weight!)
        
        NetworkManager.downloadImage(url: model.sprites.frontDefault) { image in
            pokemonDetails.image = image?.pngData()
        }
            
        do {
            try context.save()
            completion(.success(()))
        } catch {
            context.rollback()
            completion(.failure(error))
        }
    }
    
    func fetchItemsFromDatabase(completion: @escaping (Result<[PokemonDetailsItem], Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        
        let request = PokemonDetailsItem.fetchRequest()
        
        do {
            let pokemonDetailsItems = try context.fetch(request)
            completion(.success(pokemonDetailsItems))
        } catch {
            completion(.failure(error))
        }
    }
    
    func deleteItem(with model: PokemonDetailsItem, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let context = appDelegate.persistentContainer.viewContext
        
        context.delete(model)
        
        do {
            try context.save()
            completion(.success(()))
        } catch {
            completion(.failure(error))
        }
    }
}
