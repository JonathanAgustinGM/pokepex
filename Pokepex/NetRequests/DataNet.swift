//
//  DataNet.swift
//  Pokepex
//
//  Created by Jordy Gracia on 03/02/22.
//

import Alamofire
import Foundation

public protocol DataNetDelegate {
    func getPokemon(poke: Pokemon)
}

final class DataNet {
    var delegate: DataNetDelegate?
    static let shared = DataNet()
    private let PBaseUrl = "https://pokeapi.co/api/v2/"
    private let StatOk = 200 ... 209
    var pokem = Pokemon()
    var typePkm = ""
    var SinPoke = "No existe ese Pokemon"

    func getPokeID(id: Int, succes: @escaping (_ poke: Pokemon) -> Void, failure: @escaping (_ error: Error?) -> Void) {
        let url = "\(PBaseUrl)pokemon/\(id)"
        AF.request(url, method: .get).validate(statusCode: StatOk).responseDecodable(of: Pokemon.self) {
            response in

            if let poke = response.value {
                DataNet.shared.pokem = poke
                succes(poke)
                self.delegate?.getPokemon(poke: poke)
            } else {
                failure(response.error)
            }
        }
    }
}
