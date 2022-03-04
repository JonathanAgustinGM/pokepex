//
//  Info.swift
//  Pokepex
//
//  Created by Jordy Gracia on 03/02/22.
//

import AVFAudio
import CoreMIDI
import Kingfisher
import UIKit

class InfoPoke: UIViewController {
    var player: AVAudioPlayer?
    var pokemonOk = DataNet.shared.pokem
    var typesString = ""
    public var MasteBallUrl = "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/10324630-3bf7-4d5b-831a-c931da9b6de5/d68qina-5f814bda-7b04-4297-85ec-cb7f17c472c3.png/v1/fill/w_900,h_900,strp/masterball_by_vongolaleader_d68qina-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTAwIiwicGF0aCI6IlwvZlwvMTAzMjQ2MzAtM2JmNy00ZDViLTgzMWEtYzkzMWRhOWI2ZGU1XC9kNjhxaW5hLTVmODE0YmRhLTdiMDQtNDI5Ny04NWVjLWNiN2YxN2M0NzJjMy5wbmciLCJ3aWR0aCI6Ijw9OTAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.4LvALex_YNPxchCCFTIDl08w8kQTQYSQ85Wac8xzHVk"
    public var PokeBallUrl = "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Pok%C3%A9_Ball_icon.svg/1024px-Pok%C3%A9_Ball_icon.svg.png"
    public var SuperballUrl = "https://img.icons8.com/color/50/000000/superball.png"
    public var UltraBallUrl = "https://www.popsockets.mx/dw/image/v2/BDFW_PRD/on/demandware.static/-/Sites-popsockets-master-catalog/default/dwa8ece56f/images/hi-res/Ultra-Ball-Gloss_01_Top-View.png"

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

    override func viewWillAppear(_ animated: Bool) {
        Reproductor.shared.reproducir(name: "pokesong")
        let Music = Reproductor.shared.MainPlayer!
        Music.play()
        Music.volume = 0.4
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        let Music = Reproductor.shared.MainPlayer!
        if Music.isPlaying == false {
            Music.play()
        }
        let LegendaryStat = SpeciesNet.shared.IsLegendary
        if LegendaryStat == true {
            LegendaryImage.isHidden = false
            LegendaryImage.kf.setImage(with: URL(string: "https://www.thegrandgeekgathering.com/wp-content/uploads/2019/11/Legendary-Pok%C3%A9mon-Logo.png"))
            playeffect(sound: "legendary")
            EfectosSonido.shared.EfectPlayer?.volume = 0.1
        } else {
            LegendaryImage.isHidden = true
        }
        
        let MythycalStat = SpeciesNet.shared.IsMythical
        if MythycalStat == true {
            LegendaryImage.kf.setImage(with: URL(string: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ceb8d5e2-c8b7-44a2-9703-40ce62605db1/d9jd96h-9ff4ab89-a322-4910-b11f-719ab61b34d7.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2NlYjhkNWUyLWM4YjctNDRhMi05NzAzLTQwY2U2MjYwNWRiMVwvZDlqZDk2aC05ZmY0YWI4OS1hMzIyLTQ5MTAtYjExZi03MTlhYjYxYjM0ZDcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Kl5P8Uan18vdlN_8YcEhlTtGtcm5kLX5fsZzvqNMCOA"))
            LegendaryImage.isHidden = false
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
        DescrPoke.text = "Numero en la Pokedex Nacional: \(DataNet.shared.pokem.id!)\nPeso: \(Float(DataNet.shared.pokem.weight!) / 10) Kg\nAltura: \(Float(DataNet.shared.pokem.height!) / 10) m"
        // let TiposPoke = DataTipos
        TipoPkm.text = "Tipo(s): \(DataTipos)"
    }

    @IBAction func help(_ sender: Any) {
        playeffect(sound: "descrip")
    }
    @IBAction func ReturnNormalSprite(_ sender: Any) {
        FotoPkdx.kf.setImage(with: URL(string: DataNet.shared.pokem.sprites!.front_default!))
        ShinyButton.isHidden = false
        ReturnToNormal.isHidden = true
        playeffect(sound: "pin")
    }

    @IBAction func VerDescripcion(_ sender: Any) {
        playeffect(sound: "descrip")
    }

    @IBAction func ChangeToShinySprite(_ sender: Any) {
        FotoPkdx.kf.setImage(with: URL(string: DataNet.shared.pokem.sprites!.front_shiny!))
        ReturnToNormal.isHidden = false
        ShinyButton.isHidden = true
        playeffect(sound: "pin")

        /* override func viewDidAppear(_ animated: Bool)
              super.viewDidAppear(animated)
         */

        // func setup(_ pokemon: Pokemon)
    }

    @IBAction func PreviousPokeSwipe(_ sender: Any) {
        playeffect(sound: "swipe")
        let id = (DataNet.shared.pokem.id!) - 1
        DataNet.shared.getPokeID(id: id) { _ in
            SpeciesNet.shared.getSpeciepokemon(id: id) { _ in
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
        playeffect(sound: "swipe")
        let id = (DataNet.shared.pokem.id!) + 1
        DataNet.shared.getPokeID(id: id) { _ in
            SpeciesNet.shared.getSpeciepokemon(id: id) { _ in
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

extension InfoPoke {
    override func viewWillDisappear(_ animated: Bool) {
        Reproductor.shared.reproducir(name: "Title")
        let Music = Reproductor.shared.MainPlayer!
        Music.play()
        Music.volume = 0.4
    }

    func playeffect(sound: String) {
        EfectosSonido.shared.ActionSound(name: sound)
        EfectosSonido.shared.EfectPlayer?.play()
    }
}
