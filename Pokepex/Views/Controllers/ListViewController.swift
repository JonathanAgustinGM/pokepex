//
//  ListViewController.swift
//  Pokepex
//
//  Created by Jordy Gracia on 08/02/22.
// ui

import UIKit
class ListViewController: UIViewController {
    @IBOutlet var ListColeccion: UICollectionView!
    let AnchoCelda = UIScreen.main.bounds.width
    let AltoCelda = UIScreen.main.bounds.height / 8
    override func viewDidLoad() {
        super.viewDidLoad()
        //   DataNet.shared.delegate = self
        ListColeccion.dataSource = self
        ListColeccion.delegate = self
        ListColeccion.register(UINib(nibName: "CollectionOfPokesCell", bundle: nil), forCellWithReuseIdentifier: "EspCell")
    }
}

extension ListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DatesOfList.shared.ListaPoke.pokemon_entries!.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = ListColeccion.dequeueReusableCell(withReuseIdentifier: "EspCell", for: indexPath) as?
            CollectionOfPokes
        cell!.EntriesLabel.text = "\(DatesOfList.shared.ListaPoke.pokemon_entries![indexPath.row].entry_number!)"
        cell!.NmaesLabel.text = DatesOfList.shared.ListaPoke.pokemon_entries![indexPath.row].pokemon_species?.name?.capitalized
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
        DataNet.shared.getPokeID(id: indexPath.row + 1) { [self] _ in
            SpeciesNet.shared.getSpeciepokemon(id: indexPath.row + 1) { _ in
                SpeciesNet.shared.IsLegendary = SpeciesNet.shared.pokesp.is_legendary!
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
