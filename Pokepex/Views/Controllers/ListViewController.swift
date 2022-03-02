//
//  ListViewController.swift
//  Pokepex
//
//  Created by Jordy Gracia on 08/02/22.
// ui

import AVFAudio
import UIKit

class ListViewController: UIViewController {
    @IBOutlet var TextFieldNombrePoke: UITextField!
    @IBOutlet var ListColeccion: UICollectionView!
    let AnchoCelda = UIScreen.main.bounds.width
    let AltoCelda = UIScreen.main.bounds.height / 8
    let ListaPokeCollection = DatesOfList.shared.ListaPoke
    var ListaFiltrada = DatesOfList.shared.ListaPoke.pokemon_entries
    override func viewDidLoad() {
        super.viewDidLoad()
        TextFieldNombrePoke.delegate = self
        //   DataNet.shared.delegate = self
        ListColeccion.dataSource = self
        ListColeccion.delegate = self
        ListColeccion.register(UINib(nibName: "CollectionOfPokesCell", bundle: nil), forCellWithReuseIdentifier: "EspCell")
    }
}

extension ListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return ListaFiltrada!.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ListColeccion.dequeueReusableCell(withReuseIdentifier: "EspCell", for: indexPath) as?
            CollectionOfPokes
        cell!.EntriesLabel.text = "\(ListaFiltrada![indexPath.row].entry_number!)"
        cell!.NmaesLabel.text = ListaFiltrada![indexPath.row].pokemon_species?.name?.capitalized
        return cell!
    }
}

extension ListViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: AnchoCelda, height: AltoCelda)
    }
}

extension ListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        playeffect(sound: "pin")
        DataNet.shared.getPokeID(id: ListaFiltrada![indexPath.row].entry_number!) { [self] _ in
            SpeciesNet.shared.getSpeciepokemon(id: ListaFiltrada![indexPath.row].entry_number!) { _ in
                SpeciesNet.shared.IsLegendary = SpeciesNet.shared.pokesp.is_legendary!
                Reproductor.shared.MainPlayer?.stop()
                performSegue(withIdentifier: "ListToData", sender: self)
            } failure: { error in
                print(error!)
            }

        } failure: { error in
            print(error!)
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) { }
}

extension ListViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        playeffect(sound: "pin")
        if TextFieldNombrePoke.text != "" {
            let LetrasNom = TextFieldNombrePoke.text!
            let ListaP = ListaPokeCollection.pokemon_entries?.filter({ $0.pokemon_species!.name!.contains(LetrasNom.lowercased()) })
            ListaFiltrada = ListaP
            ListColeccion.reloadData()
        } else {
            ListaFiltrada = ListaPokeCollection.pokemon_entries!
            ListColeccion.reloadData()
        }
    }

    func playeffect(sound: String) {
        EfectosSonido.shared.ActionSound(name: sound)
        EfectosSonido.shared.EfectPlayer?.play()
    }
}
