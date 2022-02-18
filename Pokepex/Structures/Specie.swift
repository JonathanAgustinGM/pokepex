//
//  Specie.swift
//  Pokepex
//
//  Created by Jordy Gracia on 17/02/22.
//

import Foundation

public struct Pokespecies: Decodable {
    var capture_rate: Int?
    var base_happines: Int?
    var is_legendary: Bool?
    var is_mythical: Bool?
    var hatch_counter: Int?
    var flavor_text_entries: Array<FlavorTextEntries>?
    
    
}

public struct FlavorTextEntries: Decodable {
    var flavor_text: String?
    var language: Language?
    var version: Version?
}

public struct Language: Decodable {
    var name: String?
    var url: String?
}
public struct Version: Decodable {
    var name: String?
    var url: String?
}

