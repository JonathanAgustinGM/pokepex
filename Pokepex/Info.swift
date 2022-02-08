//
//  Info.swift
//  Pokepex
//
//  Created by Jordy Gracia on 03/02/22.
//

import Kingfisher
import UIKit

class InfoPoke: UIViewController {
    var pokemon = DataNet.shared.pokem

    @IBOutlet var NombPok: UILabel!
    @IBOutlet var TipoPkm: UILabel!
    @IBOutlet var FotoPkdx: UIImageView!
    @IBOutlet var DescrPoke: UILabel!

    //   var tipos = DataNet.shared.pokem.types.filter()
    // var tipos = DataNet.shared.pokem.types.filter { types in
    //  types.type?.name == ""
    // }
    override func viewDidLoad() {
        super.viewDidLoad()
        NombPok.text = DataNet.shared.pokem.name
        FotoPkdx.kf.setImage(with: URL(string: DataNet.shared.pokem.sprites!.front_default!))
        DescrPoke.text = "Numero en la Pokedex \(DataNet.shared.pokem.id!)\n  Peso: \(DataNet.shared.pokem.weight!)\n Altura: \(DataNet.shared.pokem.height!)"
        TipoPkm.text = "Tipo: \(DataNet.shared.pokem.types.first!.type!.name!)"
    }

    /* override func viewDidAppear(_ animated: Bool)
          super.viewDidAppear(animated)
     */

    // func setup(_ pokemon: Pokemon)
}
