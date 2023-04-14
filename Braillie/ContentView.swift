//
//  ContentView.swift
//  Braillie
//
//  Created by Yu Ho Kwok on 23/3/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var setting = Setting()
    
    var body: some View {
        //HomePageView(setting: $setting)
        
        if setting.isHomePageShow {
            HomePageView(setting: $setting)
        }else if setting.isTypeToBrailleViewShow {
            TypeToBrailleView(setting: $setting)
        }else if setting.isFlashCardViewShow {
            FlashCardView(setting: $setting)
        }else if setting.isLetterGuessViewShow {
            LetterGuessView(setting: $setting)
        }else if setting.isBraillePuzzleViewShow {
            BraillePuzzleView(setting: $setting)
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
