//
//  color.swift
//  Braillie
//
//  Created by Kai Shing Ng on 3/4/2023.
//

import Foundation
import SwiftUI
struct ColorHex {
    var fillColor = Color.init(hex: "2C4569")
    var borderColor = Color.init(hex: "CCD3DD")
    var bgColor = Color.init(hex: "EFF1F4")
    var hintColor = Color.init(hex: "8A919B")
    var navbgColor = Color.init(hex: "F6F8FB")
    var titleColor = Color.init(hex: "5282CB")
    
    
}

extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (1, 1, 1, 0)
        }

        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}
