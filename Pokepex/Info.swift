//
//  Info.swift
//  Pokepex
//
//  Created by Jordy Gracia on 03/02/22.
//

import SwiftUI

class InfoPoke {
    
    @IBOutlet weak var ImagePoke: UIImageView!
    @IBOutlet weak var NamePoke: UILabel!
    @IBOutlet weak var DescriptionPoke: UIScrollView!
    @IBAction func GetPokeId(_ sender: Any) {
        DataNet.shared.getPokeID(id: 1)
    }
}



