//
//  ViewController.swift
//  Pokepex
//
//  Created by Jordy Gracia on 03/02/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var PokedexMainImage: UIImageView!
    @IBOutlet var NumeroPoke: UITextField!
    @IBOutlet var mainView: UIView!
    @IBOutlet var BuscadoPoke: UILabel!
    @IBOutlet var SearchPoke: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        NumeroPoke.placeholder = "Ingresa el numero de PokeDex"
        NumeroPoke.delegate = self
        DataNet.shared.delegate = self
    }

    @IBAction func GetPoke(_ sender: Any) {
        textFieldDidEndEditing(NumeroPoke)
        BuscadoPoke.text = DataNet.shared.pokem.name!
    }

    @IBAction func ViewOnpoke(_ sender: UIButton) {
        performSegue(withIdentifier: "InfoSegue", sender: self)
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

            DataNet.shared.getPokeID(id: IDD)
        }
    }
}

extension ViewController: DataNetDelegate {
    func gotPokemon(pokemon: Pokemon) {
        BuscadoPoke.text = pokemon.name
    }
}
