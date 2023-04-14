//
//  Setting.swift
//  Braillie
//
//  Created by Kai Shing Ng on 30/3/2023.
//

import Foundation
import SwiftUI
struct Setting {
    var textArr = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"]
    var words = ["Lion",
                 "Tiger",
                 "Elephant",
                 "Giraffe",
                 "Zebra",
                 "Rhino",
                 "Crocodile",
                 "Gorilla",
                 "Chimpanzee",
                 "Orangutan",
                 "Koala",
                 "Kangaroo",
                 "Platypus",
                 "Emu",
                 "Ostrich",
                 "Penguin",
                 "Panda",
                 "Sloth",
                 "Capybara",
                 "Armadillo",
                 "Anteater",
                 "Hedgehog",
                 "Porcupine",
                 "Beaver",
                 "Otter",
                 "Walrus",
                 "Seal",
                 "Dolphin",
                 "Whale",
                 "Shark",
                 "Octopus",
                 "Squid",
                 "Lobster",
                 "Crab",
                 "Shrimp",
                 "Snail",
                 "Butterfly",
                 "Bee",
                 "Ant",
                 "Grasshopper",
                 "Ladybug",
                 "Spider",
                 "Scorpion",
                 "Snake",
                 "Lizard",
                 "Gecko"]
    
    var colorCheck = [ColorHex().titleColor, Color.init(hex: "CB5252"), Color.init(hex: "52CB73")]
    var imgCheck = ["checkmark.circle.fill", "xmark.circle.fill", "arrow.right.circle.fill"]
    var modes = ["type To Braille", "flash Card", "Letter Guess", "Braille Puzzle"]
    var textStr = "abcdefghijklmnopqrstuvwxyz0123456789"
    var engStr = "abcdefghijklmnopqrstuvwxyz"
    var numStr = "0123456789"
    
    var isHomePageShow = true
    var isLetterGuessViewShow = false
    var isFlashCardViewShow = false
    var isBraillePuzzleViewShow = false
    var isTypeToBrailleViewShow = false
    
    
}
