//
//  List.swift
//  Pokepex
//
//  Created by Jordy Gracia on 07/02/22.
//

import Foundation

public struct Pokedex: Decodable {
    var name: String? = ""
    var pokemon_entries: Array<Pokemon_entries>?
}

public struct Pokemon_entries: Decodable {
    var entry_number: Int? = 0
    var pokemon_species: pokemon_species?
}

public struct pokemon_species: Decodable {
    var name: String? = ""
    var url: String? = ""
}
