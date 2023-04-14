//
//  BrailleUnit.swift
//  Braillie
//
//  Created by Yu Ho Kwok on 23/3/2023.
//

import Foundation
import UIKit
import AVFoundation
import SwiftUI

class BrailleDisplay : ObservableObject {
    @Published var displayLevel = 0 
}

struct BrailleCharacter  {
    
    var character : String
    var dots : [Int]
    var consumed : [Int] = [0,0,0,0,0,0]
    var frames : [CGRect]
    
    static var A : BrailleCharacter {
        let character = BrailleCharacter(character: "A", dots: [1,0,0,0,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var B : BrailleCharacter {
        let character = BrailleCharacter(character: "B", dots: [1,1,0,0,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var C : BrailleCharacter {
        let character = BrailleCharacter(character: "C", dots: [1,0,0,1,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var D : BrailleCharacter {
        let character = BrailleCharacter(character: "D", dots: [1,0,0,1,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var E : BrailleCharacter {
        let character = BrailleCharacter(character: "E", dots: [1,0,0,0,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var F : BrailleCharacter {
        let character = BrailleCharacter(character: "F", dots: [1,1,0,1,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var G : BrailleCharacter {
        let character = BrailleCharacter(character: "G", dots: [1,1,0,1,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var H : BrailleCharacter {
        let character = BrailleCharacter(character: "H", dots: [1,1,0,0,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var I : BrailleCharacter {
        let character = BrailleCharacter(character: "I", dots: [0,1,0,1,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var J : BrailleCharacter {
        let character = BrailleCharacter(character: "J", dots: [1,0,0,1,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var K : BrailleCharacter {
        let character = BrailleCharacter(character: "K", dots: [1,0,1,0,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var L : BrailleCharacter {
        let character = BrailleCharacter(character: "L", dots: [1,1,1,0,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var M : BrailleCharacter {
        let character = BrailleCharacter(character: "M", dots: [1,0,1,1,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var N : BrailleCharacter {
        let character = BrailleCharacter(character: "N", dots: [1,0,1,1,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var O : BrailleCharacter {
        let character = BrailleCharacter(character: "O", dots: [1,0,1,0,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var P : BrailleCharacter {
        let character = BrailleCharacter(character: "P", dots: [1,1,1,1,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var Q : BrailleCharacter {
        let character = BrailleCharacter(character: "Q", dots: [1,1,1,1,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var R : BrailleCharacter {
        let character = BrailleCharacter(character: "R", dots: [1,1,1,0,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var S : BrailleCharacter {
        let character = BrailleCharacter(character: "S", dots: [0,1,1,1,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var T : BrailleCharacter {
        let character = BrailleCharacter(character: "T", dots: [0,1,1,1,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var U : BrailleCharacter {
        let character = BrailleCharacter(character: "U", dots: [1,0,1,0,0,1], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var V : BrailleCharacter {
        let character = BrailleCharacter(character: "V", dots: [1,1,1,0,0,1], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var W : BrailleCharacter {
        let character = BrailleCharacter(character: "W", dots: [0, 1, 0,1,1,1], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var X : BrailleCharacter {
        let character = BrailleCharacter(character: "X", dots: [1,0,1,1,0,1], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var Y : BrailleCharacter {
        let character = BrailleCharacter(character: "Y", dots: [1,0,1,1,1,1], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var Z : BrailleCharacter {
        let character = BrailleCharacter(character: "Z", dots: [1,0,1,0,1,1], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var hash : BrailleCharacter {
        let character = BrailleCharacter(character: "#", dots: [0,0,1,1,1,1], frames: Array(repeating: .zero, count: 6))
        return character
    }
        
    static var one : BrailleCharacter {
        let character = BrailleCharacter(character: "1", dots: [1,0,0,0,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var two : BrailleCharacter {
        let character = BrailleCharacter(character: "2", dots: [1,1,0,0,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var three : BrailleCharacter {
        let character = BrailleCharacter(character: "3", dots: [1,0,0,1,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var four : BrailleCharacter {
        let character = BrailleCharacter(character: "4", dots: [1,0,0,1,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var five : BrailleCharacter {
        let character = BrailleCharacter(character: "5", dots: [1,0,0,0,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var six : BrailleCharacter {
        let character = BrailleCharacter(character: "6", dots: [1,1,0,1,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var seven : BrailleCharacter {
        let character = BrailleCharacter(character: "7", dots: [1,1,0,1,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var eight : BrailleCharacter {
        let character = BrailleCharacter(character: "8", dots: [1,1,0,0,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
        
    static var nine : BrailleCharacter {
        let character = BrailleCharacter(character: "9", dots: [0,1,0,1,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var zero : BrailleCharacter {
        let character = BrailleCharacter(character: "0", dots: [0,1,0,1,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var fullstop : BrailleCharacter {
        let character = BrailleCharacter(character: ".", dots: [0,1,0,0,1,1], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var comma : BrailleCharacter {
        let character = BrailleCharacter(character: ",", dots: [0,1,0,0,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var colon : BrailleCharacter {
        let character = BrailleCharacter(character: ":", dots: [0,1,0,0,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var exclaim : BrailleCharacter {
        let character = BrailleCharacter(character: ":", dots: [0,1,1,0,1,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var questionMark : BrailleCharacter {
        let character = BrailleCharacter(character: ":", dots: [0,1,1,0,0,1], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    static var space : BrailleCharacter {
        let character = BrailleCharacter(character: " ", dots: [0,0,0,0,0,0], frames: Array(repeating: .zero, count: 6))
        return character
    }
    
    
    mutating func reset() {
        consumed = [0,0,0,0,0,0]
    }
    
    static func getBraile(char : String) -> BrailleCharacter{
        switch char {
        case "a", "A":
            return .A
        case "b", "B":
            return .B
        case "c", "C":
            return .C
        case "d", "D":
            return .D
        case "e", "E":
            return .E
        case "f", "F":
            return .F
        case "g", "G":
            return .G
        case "h", "H":
            return .H
        case "i", "I":
            return .I
        case "j", "J":
            return .J
        case "k", "K":
            return .K
        case "l", "L":
            return .L
        case "m", "M":
            return .M
        case "n", "N":
            return .N
        case "o", "O":
            return .O
        case "p", "P":
            return .P
        case "q", "Q":
            return .Q
        case "r", "R":
            return .R
        case "s", "S":
            return .S
        case "t", "T":
            return .T
        case "u", "U":
            return .U
        case "v", "V":
            return .V
        case "w", "W":
            return .W
        case "x", "X":
            return .X
        case "y", "Y":
            return .Y
        case "z", "Z":
            return .Z
        case "0":
            return .zero
        case "1":
            return .one
        case "2":
            return .two
        case "3":
            return .three
        case "4":
            return .four
        case "5":
            return .five
        case "6":
            return .six
        case "7":
            return .seven
        case "8":
            return .eight
        case "9":
            return .nine
        case "#":
            return .hash
        case ".":
            return .fullstop
        case ",":
            return .comma
        case "!":
            return .exclaim
        case ":":
            return .colon
        case "?":
            return .questionMark
        default:
            return .space
        }
    }
}
