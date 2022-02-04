//
//  DataNet.swift
//  Pokepex
//
//  Created by Jordy Gracia on 03/02/22.
//

import Foundation
import Alamofire

final class DataNet {

static let shared = DataNet()
    private let PBaseUrl = "https://pokeapi.co/api/v2/"
    private let StatOk = 200...209
    
    func getPokeID(id: Int) {
        let url = "\(PBaseUrl)\(id)"
        
        AF.request(url, method: .get).validate(statusCode: StatOk).responseDecodable (of: Pokemon.self) {
            response in
            
            if let poke = response.value?.id {
                print(poke)
            }else {
                print(response.error)
            }
        }
    }

}
