//
//  DescripPokes.swift
//  Pokepex
//
//  Created by Jordy Gracia on 18/02/22.
//

import UIKit

class Pokedexes: UIViewController {
    @IBOutlet weak var PokedexDesc: UICollectionView!
    var DescriptionsPokedex = SpeciesNet.shared.pokesp.flavor_text_entries!.filter({$0.language!.name! == "es"})
    let AnchoCelda = UIScreen.main.bounds.width / 1
    let AltoCelda = UIScreen.main.bounds.height / 4
    override func viewDidLoad() {
        super.viewDidLoad()
        PokedexDesc.dataSource = self
        PokedexDesc.delegate = self
        PokedexDesc.register(HeaderList.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderPokedex")
        PokedexDesc.register(UINib(nibName: "DescriptionCell", bundle: nil), forCellWithReuseIdentifier: "PokedexCell")
        
    }
 
}
extension Pokedexes: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        self.DescriptionsPokedex.count
    }
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
       let header = PokedexDesc.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "HeaderPokedex", for: indexPath) as? HeaderList
        return header!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = PokedexDesc.dequeueReusableCell(withReuseIdentifier: "PokedexCell", for: indexPath) as?
        DescriptionCell
        cell!.VersionJuego.text = "Version:  \(DescriptionsPokedex[indexPath.row].version!.name!.capitalized)"
        cell!.DescriptionPoke.text = DescriptionsPokedex[indexPath.row].flavor_text
        return cell!
    }
    
}
extension Pokedexes: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: AnchoCelda, height: AltoCelda)
}
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: AnchoCelda, height: AltoCelda / 6)
    }
}

