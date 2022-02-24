//
//  SpeciesNet.swift
//  Pokepex
//
//  Created by Jordy Gracia on 17/02/22.
//

import Foundation
import Alamofire

final class SpeciesNet {
    static let shared = SpeciesNet()
    private let SUrlBase = "https://pokeapi.co/api/v2/pokemon-species/"
    private let StatOk = 200 ... 209
    var pokesp = Pokespecies()
    var IsLegendary = false
    
    func getSpeciepokemon(
        id: Int,
        succes: @escaping (_ pokespecie: Pokespecies) -> Void,
        failure: @escaping (_ error: Error?) -> Void) {
        let spurl = "\(SUrlBase)\(id)"
        AF.request(spurl , method: .get).validate(statusCode: StatOk).responseDecodable(of: Pokespecies.self) {
            response in
        if let pokespecie = response.value {
            SpeciesNet.shared.pokesp = pokespecie
            SpeciesNet.shared.IsLegendary = SpeciesNet.shared.pokesp.is_legendary!
            succes(pokespecie)
        } else {
            failure(response.error)
}

}
    }
}
