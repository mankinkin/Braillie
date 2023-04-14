//
//  FlashCard.swift
//  Braillie
//
//  Created by Kai Shing Ng on 9/4/2023.
//

import SwiftUI

struct FlashCard: View {
    @Binding var isNext : Bool
    var hexColor = ColorHex()
    var index : Int
    @Binding var inputText : BraillArticle
    var isAlphabetShow : Bool
    
    var body: some View {
        VStack{
            if (isNext && index==1) || index == 2{
                Image(systemName: "hand.point.up.braille")
                    .foregroundColor(hexColor.hintColor)
                    .font(Font.system(size: 24))
                    .padding(.top, 10)
                
                
                
                BrailleView(article: $inputText, scale: 0.8)
                    .frame(width: 716,height: 92)
                    .background(hexColor.navbgColor)
                    .cornerRadius(17)
                

                Image(systemName:  "text.cursor")
                    .foregroundColor(hexColor.hintColor)
                    .font(.system(size: 24))
                    .padding(.top, 77)
                    .padding(.bottom, 17)
                
                
                
                Text(inputText.article)
                    .frame(height: 14)
                    .textCase(.uppercase)
                    .foregroundColor(hexColor.fillColor)
                    .font(.custom("DIN-BlackAlternate",fixedSize: 14))
                    .tracking(3.11)
                    .background(isAlphabetShow ? .clear : hexColor.fillColor)
                    .cornerRadius(6)
                

            }
            
            
            
        }
        .frame(width: isNext  && index<2 ? (830 + CGFloat(index)*60) : 770 + CGFloat(index)*60 , height: isNext && index<2  ? 340 + CGFloat(index)*60 : 280 + CGFloat(index)*60 )
        .background(index==2 || (isNext && index==1) ? .white : hexColor.navbgColor)
        .cornerRadius(73)
        .padding(70)
        .offset(y: isNext && index==2 ? 1000 : 10 - CGFloat(index)*10 )
        .offset(y: isNext && index<2 ? 20 - CGFloat(index)*40 : 10 - CGFloat(index)*10)
    }
}

