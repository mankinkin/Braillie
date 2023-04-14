//
//  AudioManager.swift
//  Braillie
//
//  Created by Yu Ho Kwok on 24/3/2023.
//

import Foundation
import AVFoundation
import UIKit

class AudioManager {
    static var shared = AudioManager()
    
    var feedbackGenerator = UIImpactFeedbackGenerator(style: .heavy)
    
    init() {
        print("activate audio session")
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playback)
            try session.setActive(true)
        } catch _ {
        }
    }
    
    func trigger() {
        playSound()
        triggerHaptic()
    }
    
    var player : AVAudioPlayer?
    
    func playSound(){
        if let url = Bundle.main.url(forResource: "haptic", withExtension: "m4a") {
            if let player = try? AVAudioPlayer(contentsOf: url) {
                self.player = player
                self.player?.volume = 1
                self.player?.play()
            }
        }
    }
    
    func playSystemSound() {
        AudioServicesPlaySystemSound(1306)
    }
    
    func triggerHaptic(){
        feedbackGenerator.impactOccurred()
    }
}
