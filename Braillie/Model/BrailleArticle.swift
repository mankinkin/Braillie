//
//  BrailleArticle.swift
//  Braillie
//
//  Created by Yu Ho Kwok on 23/3/2023.
//

import SwiftUI
import AVFoundation

struct BraillArticle {
    var article : String {
        didSet {
            reloadBraille()
            randomSeed = Int.random(in: 0...60000)
        }
    }
    var randomSeed : Int = Int.random(in: 0...60000)
    var characters : [BrailleCharacter]
    
    
    mutating func reloadBraille() {
        withAnimation {
            characters.removeAll()
            for char in article.capitalized {
                let braileChar = BrailleCharacter.getBraile(char: "\(char)")
                characters.append(braileChar)
            }
        }
    }
    
    init(string:  String){
        article = string
        characters = []
        
        for char in string.capitalized {
            let braileChar = BrailleCharacter.getBraile(char: "\(char)")
            characters.append(braileChar)
        }

    }
    
    init(){
        print("activate audio session")
        let session = AVAudioSession.sharedInstance()
        do {
            try session.setCategory(.playback)
            try session.setActive(true)
        } catch _ {
            
        }
        article = "ATAT"
        self.characters = [.A, .T, .A, .T]
    }
    
    mutating func reset() {
        for i in 0..<characters.count {
            characters[i].reset()
        }
    }
    
    mutating func touch(_ location : CGPoint, for mode : BrailleView.Mode, isHaptic : Bool = false) {
        
        
       
        
        if mode == .display || (mode == .about && !isHaptic) ||  mode == .braillePuzzle {
            for i in 0..<characters.count {
//                print(characters[i].frames[0])
//                print(location)
                if characters[i].frames[0].contains(location) && characters[i].consumed[0] == 0 {
                    withAnimation {
                        characters[i].consumed[0] = 1
                    }
                } else if characters[i].frames[0].contains(location) == false {
                    characters[i].consumed[0] = 0
                }
            }
            
            return
        }
        
        for j in 0..<characters.count {
            for i in 0..<6  {
                if characters[j].frames[i].contains(location) {
                    if characters[j].dots[i] == 1 && characters[j].consumed[i] == 0 {
                        //print vibrate
                        //print("vibrate for \(characters[j].character) - no \(i)")
                        AudioManager.shared.trigger()
                    }
                } else {
                    characters[j].consumed[i] = 0
                }
            }
        }
    }
}
