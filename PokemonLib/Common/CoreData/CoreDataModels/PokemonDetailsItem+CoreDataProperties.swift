//
//  PokemonDetailsItem+CoreDataProperties.swift
//  PokemonLib
//
//  Created by Артур on 23.10.23.
//
//

import Foundation
import CoreData


extension PokemonDetailsItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<PokemonDetailsItem> {
        return NSFetchRequest<PokemonDetailsItem>(entityName: "PokemonDetailsItem")
    }

    @NSManaged public var height: Int64
    @NSManaged public var image: Data?
    @NSManaged public var name: String?
    @NSManaged public var type: String?
    @NSManaged public var weight: Int64

}

extension PokemonDetailsItem : Identifiable {

}
