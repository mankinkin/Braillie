//
//  BrailleIntro.swift
//  Braillie
//
//  Created by Kai Shing Ng on 13/4/2023.
//

import SwiftUI

struct BrailleIntro: View {
    var hexColor = ColorHex()
    @State var AtoM = BraillArticle(string: String(Setting().engStr.prefix(13)))
    @State var NtoZ = BraillArticle(string: String(Setting().engStr.suffix(13)))
    
    var body: some View {
        VStack{
            HStack{
                Text("BRAILLE")
                    .font(.custom("DIN-BlackAlternate",fixedSize: 34))
                    .foregroundColor(hexColor.titleColor)
                Spacer()
            }
            //.padding(.vertical, 7)
            //.padding(.bottom, 10)
            
            
            
            
            HStack{
                Text("Braille is a system of")
                    .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                    .foregroundColor(ColorHex().fillColor)
                Text("raised dots")
                    .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                    .foregroundColor(ColorHex().titleColor)
                    .padding(.horizontal, -3)
                Text("that can be read with fingers by people who are blind or have low vision.")
                    .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                    .foregroundColor(ColorHex().fillColor)
                Spacer()
                
            }
            
            HStack{
                Text("It is not a language but rather a code by which many languages may be written and read.")
                    .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                    .foregroundColor(ColorHex().fillColor)
                Spacer()
            }
            
            HStack{
                Text("The system consists of 63 characters, each made up of")
                    .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                    .foregroundColor(ColorHex().fillColor)
                Text("one to six raised dots")
                    .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                    .foregroundColor(ColorHex().titleColor)
                    .padding(.horizontal, -3)
                Text("arranged in")
                    .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                    .foregroundColor(ColorHex().fillColor)
                Text("a six-position matrix")
                    .padding(.horizontal, -3)
                    .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                    .foregroundColor(ColorHex().titleColor)
                Text("or cell.")
                    .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                    .foregroundColor(ColorHex().fillColor)
                
                Spacer()
            }
            
        }.padding([.leading, .bottom], 40)
        
        
        Text("26 English alphabet letters ")
            .font(.custom("DIN-BlackAlternate", fixedSize: 15))
            .foregroundColor(ColorHex().titleColor)
        
        
        
        BrailleView(article: $AtoM, isHint: true, scale: 0.8).padding(.bottom, -10)
        
        BrailleView(article: $NtoZ, isHint: true, scale: 0.8)
        
        
        HStack(){
            Image(systemName: "water.waves")
                .foregroundColor(hexColor.hintColor)
            Text("Drag slowly on the braille to feel the haptic.")
                .font(.custom("DIN-MediumAlternate",fixedSize: 17))
        }
        .foregroundColor(hexColor.hintColor)
        .padding(20)
        //.offset(y: 5)
        
        Image(systemName: "smiley")
            .font(.system(size: 24))
            .foregroundColor(hexColor.titleColor)
            .padding(3)
        
        Text("Braillie hopes to introduce Braille to more people's lives, creating a more inclusive community.")
            .font(.custom("DIN-MediumAlternate", fixedSize: 17))
            .foregroundColor(ColorHex().titleColor)
        
           
        
        
    }
}

