//
//  ImageButton.swift
//  Braillie
//
//  Created by Kai Shing Ng on 4/4/2023.
//

import SwiftUI

struct ImageButton: View {
    
    var mode = "type To Braille"
    @Binding var setting: Setting
    var body: some View {
        VStack {
            //Image(mode.filter { !$0.isWhitespace }).padding(-35)
            Button {
                if mode == setting.modes[0] {
                    setting.isTypeToBrailleViewShow = true
                }else if mode == setting.modes[1] {
                    setting.isFlashCardViewShow = true
                }else if mode == setting.modes[2] {
                    setting.isLetterGuessViewShow = true
                }else{
                    setting.isBraillePuzzleViewShow = true
                }
                setting.isHomePageShow = false
            } label: {
                Image(mode.filter { !$0.isWhitespace }).padding(-35)
            }
        }
    }
}


