//
//  Dot.swift
//  Braillie
//
//  Created by Kai Shing Ng on 4/4/2023.
//

import SwiftUI

struct Dot: View {
    var isFill:Bool
    var scale = 1.0
    var lineWidth = 1
    var hexColor = ColorHex()
    
    var body: some View {
        Circle()
            //.fill(isFill ? hexColor.fillColor : .white)
            .strokeBorder(isFill ? hexColor.fillColor : hexColor.borderColor, lineWidth: CGFloat(lineWidth))
            .background(
                Circle()
                    .fill(isFill ? hexColor.fillColor : .white)
            )
            .frame(width: 10 * scale, height: 10 * scale)
            .padding(5 * scale)
    }
}


