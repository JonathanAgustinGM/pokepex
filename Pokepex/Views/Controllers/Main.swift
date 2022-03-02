//
//  ViewController.swift
//  Pokepex
//
//  Created by Jordy Gracia on 03/02/22.
//

import AVFAudio
import Kingfisher
import UIKit

class ViewController: UIViewController, DataNetDelegate, DatesOfListDelegate {
    func gotPokemonList(pokemonlist: Pokedex) {
    }

    func getPokemon(poke: Pokemon) {
    }

    @IBOutlet var PokedexMainImage: UIImageView!
    @IBOutlet var NumeroPoke: UITextField!
    @IBOutlet var mainView: UIView!
    @IBOutlet var BuscadoPoke: UILabel!
    @IBOutlet var SearchPoke: UIButton!
    @IBOutlet var ViewListOfPokes: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        PokedexMainImage.kf.setImage(with: URL(string: "https://cdn76.picsart.com/209915339005202.gif"))
        NumeroPoke.delegate = self
        DataNet.shared.delegate = self
        DatesOfList.shared.delegate = self
        // gotPokemonList(pokemonlist: DatesOfList.shared.ListaPoke)
    }

    @IBAction func GetPoke(_ sender: Any) {
        textFieldDidEndEditing(NumeroPoke)
    }

    @IBAction func GetListOfPokes(_ sender: Any) {
        // Reproductor.shared.MainPlayer?.setVolume(0.1, fadeDuration: 2)
        playeffect(sound: "pin")
        DatesOfList.shared.gotPokemonList { [self] _ in
            performSegue(withIdentifier: "ListaSegue", sender: UIButton.self)

        } failure: { _ in
            print(DatesOfList.shared.ListaPoke)
        }

        // let PokeDexUno = DatesOfList.shared.ListaPoke.pokemon_entries
        // let PokeDexDos = PokeDexUno.compactMap {name in name}
    }

    @IBAction func VerListaPikes(_ sender: Any) {
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let caracteres = CharacterSet.decimalDigits
        let caracterSet = CharacterSet(charactersIn: string)
        return caracteres.isSuperset(of: caracterSet)
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if let PosicionPdx: String = NumeroPoke.text {
            let IDD: Int = Int(PosicionPdx) ?? 1
            SpeciesNet.shared.getSpeciepokemon(id: IDD) { _ in
                // print(pokespecie)
            } failure: { _ in
                print("error")
            }

            DataNet.shared.getPokeID(id: IDD) { [self] poke in
                SpeciesNet.shared.getSpeciepokemon(id: IDD) { _ in
                    // print(pokespecie)
                    playeffect(sound: "Succes")
                    sleep(2)
                    performSegue(withIdentifier: "InfoSegue", sender: UIButton.self)
                } failure: { _ in
                    print("error")
                }

                BuscadoPoke.textColor = .black
                BuscadoPoke.text = "¡Tu pokemon es \(poke.name!.capitalized)!"
            } failure: { _ in
                self.BuscadoPoke.textColor = .red
                self.BuscadoPoke.text = "Este pokemon aún no \n existe 🥺"
                self.playeffect(sound: "failure")
            }
        }
    }
}

extension ViewController {
    override func viewWillAppear(_ animated: Bool) {
        Reproductor.shared.reproducir(name: "Title")
        Reproductor.shared.MainPlayer?.play()
        Reproductor.shared.MainPlayer?.volume = 0.4
    }

    override func viewWillDisappear(_ animated: Bool) {
        Reproductor.shared.MainPlayer?.stop()
    }

    func playeffect(sound: String) {
        EfectosSonido.shared.ActionSound(name: sound)
        EfectosSonido.shared.EfectPlayer?.play()
    }
}
