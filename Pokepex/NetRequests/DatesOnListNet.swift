//
//  DatesOnListNet.swift
//  Pokepex
//
//  Created by Jordy Gracia on 08/02/22.
//

import Alamofire
import Foundation

public protocol DatesOfListDelegate {
    func gotPokemonList(pokemonlist: Pokedex)
}

final class DatesOfList {
    var delegate: DatesOfListDelegate?
    static let shared = DatesOfList()
    private let StatOk = 200 ... 209
    public var ListaPoke = Pokedex()
    func gotPokemonList(succes: @escaping (_ MyList: Pokedex) -> Void, failure: @escaping (_ error: Error?) -> Void) {
        let urlist = "https://pokeapi.co/api/v2/pokedex/1"
        AF.request(urlist, method: .get).validate(statusCode: StatOk).responseDecodable(of: Pokedex.self) {
            response in
            // print(response)
            if let MyList = response.value {
                // print(MyList)
                DatesOfList.shared.ListaPoke = MyList
                succes(MyList)

                self.delegate?.gotPokemonList(pokemonlist: self.ListaPoke)
            } else {
                failure(response.error)
            }
        }
    }
}
