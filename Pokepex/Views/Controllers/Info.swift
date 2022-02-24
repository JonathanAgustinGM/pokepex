//
//  Info.swift
//  Pokepex
//
//  Created by Jordy Gracia on 03/02/22.
//

import CoreMIDI
import Kingfisher
import UIKit

class InfoPoke: UIViewController {
    var pokemonOk = DataNet.shared.pokem
    var typesString = ""
    private var MasteBallUrl = "https://toppng.com/uploads/preview/okegreatultramaster-ball-super-mario-world-boo-sprite-11562983716xog8m5pbnj.png"
    private var PokeBallUrl = "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTszpqxRrFI_pVQRfuwHEka3gagiS7Env0SRwGTJDXbqA8fOeohp73AY4pcoHHvnocfz3A&usqp=CAU"
    private var SuperballUrl = "https://www.pngfind.com/pngs/m/248-2488574_poke-great-ultra-master-ball-8-bit-pokeball.png"
    private var UltraBallUrl = "https://toppng.com/uploads/preview/ultra-ball-pokeball-pixel-11562993344nv8vdc1gm6.png"

    @IBOutlet var ShinyButton: UIButton!
    @IBOutlet var ReturnToNormal: UIButton!
    @IBOutlet var NombPok: UILabel!
    @IBOutlet var TipoPkm: UILabel!
    @IBOutlet var FotoPkdx: UIImageView!
    @IBOutlet var DescrPoke: UILabel!
    @IBOutlet var pokepantalla: UIImageView!
    @IBOutlet var pokeanimated: UIImageView!
    @IBOutlet var LegendaryImage: UIImageView!
    @IBOutlet var CatchRateImage: UIImageView!
    let DataTipos = DataNet.shared.pokem.types.compactMap { PokeType in
        PokeType.type?.name!.capitalized
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let LegendaryStat = SpeciesNet.shared.IsLegendary
        print(LegendaryStat)
        if LegendaryStat == true {
            LegendaryImage.isHidden = false
            LegendaryImage.kf.setImage(with: URL(string: "https://www.thegrandgeekgathering.com/wp-content/uploads/2019/11/Legendary-Pok%C3%A9mon-Logo.png"))
        } else {
            LegendaryImage.isHidden = true
        }
        let CatchRate = SpeciesNet.shared.pokesp.capture_rate!
        switch CatchRate {
        case 100 ... 250:
            CatchRateImage.kf.setImage(with: URL(string: PokeBallUrl))
        case 50 ... 100:
            CatchRateImage.kf.setImage(with: URL(string: SuperballUrl))
        case 6 ... 50:
            CatchRateImage.kf.setImage(with: URL(string: UltraBallUrl))
        case 0 ... 6:
            CatchRateImage.kf.setImage(with: URL(string: MasteBallUrl))
        default:
            CatchRateImage.kf.setImage(with: URL(string: PokeBallUrl))
        }

        pokeanimated.kf.setImage(with: URL(string: "http://24.media.tumblr.com/2980aff6917398465169d89c89daf4a4/tumblr_mt166vEE9E1sgqvzxo1_500.gif"))
        ReturnToNormal.isHidden = true
        ShinyButton.isHidden = false
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
    @IBAction func PreviousPokeSwipe(_ sender: Any) {
        let id = (DataNet.shared.pokem.id!) - 1
        DataNet.shared.getPokeID(id: id) { poke in
            SpeciesNet.shared.getSpeciepokemon(id: id) { pokespecie in
                SpeciesNet.shared.IsLegendary = SpeciesNet.shared.pokesp.is_legendary!
                self.viewDidLoad()
            } failure: { error in
                print(error!)
            }

            
        } failure: { error in
            print(error!)
        }

    }
    @IBAction func NextPokeSwipe(_ sender: Any) {
        let id = (DataNet.shared.pokem.id!) + 1
        DataNet.shared.getPokeID(id: id) { poke in
            SpeciesNet.shared.getSpeciepokemon(id: id) { pokespecie in
                SpeciesNet.shared.IsLegendary = SpeciesNet.shared.pokesp.is_legendary!
                self.viewDidLoad()
            } failure: { error in
                print(error!)
            }

        } failure: { error in
            print(error!)
        }
    }
}
