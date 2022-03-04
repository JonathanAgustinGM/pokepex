//
//  HelpImgs.swift
//  Pokepex
//
//  Created by Jordy Gracia on 04/03/22.
//

import UIKit
import Kingfisher

class HelpImgs: UIViewController {

    @IBOutlet weak var FingerSwapImage: UIImageView!
    @IBOutlet weak var SupBImg: UIImageView!
    @IBOutlet weak var PokeBIm: UIImageView!
    @IBOutlet weak var UltraBImg: UIImageView!
    @IBOutlet weak var MasterBImg: UIImageView!
    @IBOutlet weak var IsLegendaryImg: UIImageView!
    @IBOutlet weak var IsMythicalImg: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        PokeBIm.kf.setImage(with: URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/5/53/Pok%C3%A9_Ball_icon.svg/1024px-Pok%C3%A9_Ball_icon.svg.png"))
        SupBImg.kf.setImage(with: URL(string: "https://img.icons8.com/color/50/000000/superball.png"))
        UltraBImg.kf.setImage(with: URL(string: "https://www.popsockets.mx/dw/image/v2/BDFW_PRD/on/demandware.static/-/Sites-popsockets-master-catalog/default/dwa8ece56f/images/hi-res/Ultra-Ball-Gloss_01_Top-View.png?sw=800&sh=800"))
        MasterBImg.kf.setImage(with: URL(string: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/10324630-3bf7-4d5b-831a-c931da9b6de5/d68qina-5f814bda-7b04-4297-85ec-cb7f17c472c3.png/v1/fill/w_900,h_900,strp/masterball_by_vongolaleader_d68qina-fullview.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7ImhlaWdodCI6Ijw9OTAwIiwicGF0aCI6IlwvZlwvMTAzMjQ2MzAtM2JmNy00ZDViLTgzMWEtYzkzMWRhOWI2ZGU1XC9kNjhxaW5hLTVmODE0YmRhLTdiMDQtNDI5Ny04NWVjLWNiN2YxN2M0NzJjMy5wbmciLCJ3aWR0aCI6Ijw9OTAwIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmltYWdlLm9wZXJhdGlvbnMiXX0.4LvALex_YNPxchCCFTIDl08w8kQTQYSQ85Wac8xzHVk"))
        IsLegendaryImg.kf.setImage(with: URL(string: "https://www.thegrandgeekgathering.com/wp-content/uploads/2019/11/Legendary-Pok%C3%A9mon-Logo.png"))
        IsMythicalImg.kf.setImage(with: URL(string: "https://images-wixmp-ed30a86b8c4ca887773594c2.wixmp.com/f/ceb8d5e2-c8b7-44a2-9703-40ce62605db1/d9jd96h-9ff4ab89-a322-4910-b11f-719ab61b34d7.png?token=eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ1cm46YXBwOjdlMGQxODg5ODIyNjQzNzNhNWYwZDQxNWVhMGQyNmUwIiwiaXNzIjoidXJuOmFwcDo3ZTBkMTg4OTgyMjY0MzczYTVmMGQ0MTVlYTBkMjZlMCIsIm9iaiI6W1t7InBhdGgiOiJcL2ZcL2NlYjhkNWUyLWM4YjctNDRhMi05NzAzLTQwY2U2MjYwNWRiMVwvZDlqZDk2aC05ZmY0YWI4OS1hMzIyLTQ5MTAtYjExZi03MTlhYjYxYjM0ZDcucG5nIn1dXSwiYXVkIjpbInVybjpzZXJ2aWNlOmZpbGUuZG93bmxvYWQiXX0.Kl5P8Uan18vdlN_8YcEhlTtGtcm5kLX5fsZzvqNMCOA"))
        FingerSwapImage.kf.setImage(with: URL(string: "https://www.careerslive.london/assets/img/hand.gif"))
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
