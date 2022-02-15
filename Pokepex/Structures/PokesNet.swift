//
//  PokesNet.swift
//  Pokepex
//
//  Created by Jordy Gracia on 03/02/22.
//

import Foundation

// MARK: Estructura Pokemon

public struct Pokemon: Decodable {
    var height: Int? = 0
    var name: String? = ""
    var id: Int? = 0
    var weight: Int? = 0
    var base_experience: Int? = 0
    var sprites: Sprites?
    var types: Array<Types> = []
    var species: Species?
}

public struct Sprites: Decodable {
    var back_default: String? = ""
    var back_female: String? = ""
    var back_shiny: String? = ""
    var back_shiny_female: String? = ""
    var front_default: String? = ""
    var front_female: String? = ""
    var front_shiny: String? = ""
    var front_shiny_female: String? = ""
}

public struct Species: Decodable {
    var name: String? = ""
    var url: String? = ""
}

// public struct types: Decodable {
//  var slot: Int? = 0
// var type: type?
// }

public struct Types: Decodable {
    var slot: Int? = 0
    var type: PokeType?

    public init(slot arg0: Int? = 0, type arg1: PokeType? = nil) {
        slot = arg0
        type = arg1
    }
}

public struct PokeType: Decodable {
    var name: String? = ""
    var url: String? = ""
}

public struct PokemonRow: Codable {
    let id: Int?
    let name: String?

    public init(id arg0: Int?, name arg1: String?) {
        id = arg0
        name = arg1
    }

    enum CodingKeys: String, CodingKey {
        case id = "identificador"
        case name = "nombre"
    }
}
