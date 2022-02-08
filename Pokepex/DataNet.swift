//
//  DataNet.swift
//  Pokepex
//
//  Created by Jordy Gracia on 03/02/22.
//

import Alamofire
import Foundation

public protocol DataNetDelegate {
    func gotPokemon(pokemon: Pokemon)
}

final class DataNet {
    private init() {
    }

    var delegate: DataNetDelegate?
    static let shared = DataNet()
    private let PBaseUrl = "https://pokeapi.co/api/v2/"
    private let StatOk = 200 ... 209
    var pokem = Pokemon()
    var typePkm = ""

    func getPokeID(id: Int) {
        let url = "\(PBaseUrl)pokemon/\(id)"
        AF.request(url, method: .get).validate(statusCode: StatOk).responseDecodable(of: Pokemon.self) {
            response in

            if let poke = response.value {
                /*
                 print(poke.name!)
                 print("\(poke.height!)ft")
                 print("\(poke.weight!)lb")
                 print("Número en la PokeDex \(poke.id!)")
                 print("\(poke.base_experience!) EXP")
                 print(poke.sprites!.front_default!)
                 print(poke.types)
                 print(poke.types.first!.type!.url!)
                 DataNet.shared.Pokemn = poke.name!
                 DataNet.shared.Img = poke.sprites!.front_default!
                 DataNet.shared.weigth = "\(poke.weight!) lb"
                 DataNet.shared.height = "\(poke.height!) ft"
                 DataNet.shared.PdxNum = "Número en la PokeDex \(poke.id!)"

                  */
                self.delegate?.gotPokemon(pokemon: poke)
                // DataNet.shared.typePkm = poke.types.first!.type!.name!

                DataNet.shared.pokem = poke
            } else {
                print(response.error!)
            }
        }
    }
}
