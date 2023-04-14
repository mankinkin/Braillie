//
//  BrailleView.swift
//  Braillie
//
//  Created by Yu Ho Kwok on 23/3/2023.
//

import SwiftUI

struct BrailleView: View {

    enum Mode {
        case display //no touch for each dot
        case experience //with haptic effect
        case letterGuess
        case braillePuzzle
        case about
    }
    
    @Binding var article : BraillArticle
    
    var isBraillePuzzle = false
    var isHint = false
    var isHaptic = false
    var mode = Mode.experience
    var scale = 1.0
    
    var onChanged: ((CGPoint, String) -> DragState)?
    var onEnded: ((CGPoint, Int, String) -> Void)?

   
    
    
    var body: some View {
        
        //LazyVGrid(columns: gridItemLayout) {
            HStack (spacing: 10 * scale) {
                ForEach(0..<article.characters.count, id:\.self) {
                    i in
                    VStack{
                        if isHaptic {
                            BrailleCharView(article: $article, position: i, character:
                                                $article.characters[i], mode: mode, scale: self.scale, isHaptic: true)
                        }else if !isBraillePuzzle {
                            BrailleCharView(article: $article, position: i, character:
                                                $article.characters[i], mode: mode, scale: self.scale)
                            
                        }else{
                            BrailleCharView(article: $article, position: i, character:
                                                $article.characters[i], mode: mode, scale: self.scale, onChanged: onChanged, onEnded: onEnded, index: i)
                        }
                        
                        
                        if isHint {
                            Text(article.characters[i].character)
                                .font(.custom("DIN-MediumAlternate", fixedSize: 20))
                                .foregroundColor(ColorHex().titleColor)
                                .padding(.vertical, -10)
                        }
                        
                    }
                }
            }
        //}
        
        .gesture(
            DragGesture(minimumDistance: 1, coordinateSpace: .global)
                .onChanged {
                    value in
                        article.touch(value.location, for: mode, isHaptic: isHaptic)
                    
                    
                }
                
                .onEnded{
                    value in
                    
                        article.reset()
                    
                    
                }
        )
        .padding()
    }
}
