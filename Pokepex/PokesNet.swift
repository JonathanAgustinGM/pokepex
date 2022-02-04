//
//  PokesNet.swift
//  Pokepex
//
//  Created by Jordy Gracia on 03/02/22.
//

import Foundation

//Estructura Pokemon

struct Pokemon: Decodable {
    let height: Int?
    let name: String?
    let id: Int?
    let weight: Int?
}
