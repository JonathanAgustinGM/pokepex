//
//  SoundEffects.swift
//  Pokepex
//
//  Created by Jordy Gracia on 02/03/22.
//

import Foundation
import AVFAudio

final class EfectosSonido {
    static let shared = EfectosSonido()
    public var EfectPlayer: AVAudioPlayer?
    
    func ActionSound(name:String) {
        do {
            EfectPlayer = try? AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: name , ofType: "mp3")!))
            EfectPlayer?.prepareToPlay()
        }
        catch{
        }
    }
}
