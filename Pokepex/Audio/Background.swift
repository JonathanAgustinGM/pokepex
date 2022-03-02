//
//  Audio.swift
//  Pokepex
//
//  Created by Jordy Gracia on 01/03/22.
//

import Foundation
import AVFAudio

final class Reproductor {
    static let shared = Reproductor()
    public var MainPlayer: AVAudioPlayer?
    
    func reproducir(name:String) {
        do {
            MainPlayer = try? AVAudioPlayer(contentsOf: URL.init(fileURLWithPath: Bundle.main.path(forResource: name , ofType: "mp3")!))
            MainPlayer?.prepareToPlay()
        }
        catch{
        }
    }
}
