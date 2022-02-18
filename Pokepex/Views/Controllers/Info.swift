//
//  Info.swift
//  Pokepex
//
//  Created by Jordy Gracia on 03/02/22.
//

import Kingfisher
import UIKit
import CoreMIDI

class InfoPoke: UIViewController {
    var pokemonOk = DataNet.shared.pokem
    var typesString = ""

    @IBOutlet var ShinyButton: UIButton!
    @IBOutlet var ReturnToNormal: UIButton!
    @IBOutlet var NombPok: UILabel!
    @IBOutlet var TipoPkm: UILabel!
    @IBOutlet var FotoPkdx: UIImageView!
    @IBOutlet var DescrPoke: UILabel!
    @IBOutlet var pokepantalla: UIImageView!
    @IBOutlet var pokeanimated: UIImageView!

    let DataTipos = DataNet.shared.pokem.types.compactMap { PokeType in
        PokeType.type?.name!.capitalized
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pokeanimated.kf.setImage(with: URL(string: "http://24.media.tumblr.com/2980aff6917398465169d89c89daf4a4/tumblr_mt166vEE9E1sgqvzxo1_500.gif"))
        ReturnToNormal.isHidden = true
        NombPok.text = DataNet.shared.pokem.name?.capitalized
        FotoPkdx.kf.setImage(with: URL(string: DataNet.shared.pokem.sprites!.front_default!))
        DescrPoke.text = "Numero en la Pokedex Nacional: \(DataNet.shared.pokem.id!)\n  Peso: \(DataNet.shared.pokem.weight!)lb \n Altura: \(DataNet.shared.pokem.height!)ft"
        // let TiposPoke = DataTipos
        TipoPkm.text = "Tipo(s): \(DataTipos)"
    }

    @IBAction func ReturnNormalSprite(_ sender: Any) {
        FotoPkdx.kf.setImage(with: URL(string: DataNet.shared.pokem.sprites!.front_default!))
        ShinyButton.isHidden = false
        ReturnToNormal.isHidden = true
    }

    @IBAction func ChangeToShinySprite(_ sender: Any) {
        FotoPkdx.kf.setImage(with: URL(string: DataNet.shared.pokem.sprites!.front_shiny!))
        ReturnToNormal.isHidden = false
        ShinyButton.isHidden = true

        /* override func viewDidAppear(_ animated: Bool)
              super.viewDidAppear(animated)
         */

        // func setup(_ pokemon: Pokemon)
    }
}
