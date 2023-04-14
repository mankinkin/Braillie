//
//  hintView.swift
//  Braillie
//
//  Created by Kai Shing Ng on 5/4/2023.
//

import SwiftUI

struct HintView: View {
    @Binding var isHintShow: Bool
    @State var AtoM = BraillArticle(string: String(Setting().engStr.prefix(13)))
    @State var NtoZ = BraillArticle(string: String(Setting().engStr.suffix(13)))
    
    var hexColor = ColorHex()
    
    var body: some View {
        
        
        ZStack{
            //Image("").blur(radius: 10).ignoresSafeArea()
         
            
            VStack{

                if isHintShow{
                    HStack{
                        Spacer()
                        Button(action: {
                            withAnimation(
                                .spring()
                            ) {
                                isHintShow.toggle()
                                
                            }
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 24))
                                .foregroundColor(hexColor.titleColor)
                        })
                        
                    }
                    .padding(.trailing, 30)
                    .padding(.top, 15)
                    
                    
                    
                    VStack{
                        Text("26 English alphabet letters ")
                            .font(.custom("DIN-BlackAlternate", fixedSize: 15))
                            .foregroundColor(ColorHex().titleColor)
                        
                        
                        
                        
                        BrailleView(article: $AtoM, isHint: true, scale: 0.8).padding(.bottom, -10)
                        
                        BrailleView(article: $NtoZ, isHint: true, scale: 0.8)
                        
                    }.padding(.bottom, 40)
                    
                    HStack(){
                        Image(systemName: "water.waves")
                            .foregroundColor(hexColor.hintColor)
                        Text("Drag slowly on the braille to feel the haptic.")
                            .font(.custom("DIN-MediumAlternate",fixedSize: 17))
                    }
                    .foregroundColor(hexColor.hintColor)
                    .padding(20)
                    .offset(y: -20)
                }else{
                    Button(action: {
                        withAnimation(
                            .spring()
                        ) {
                            isHintShow.toggle()
                        }
                        //isHintShow.toggle()
                    }, label: {
                        HStack{
                            Image(systemName: "person.fill.questionmark")
                                .foregroundColor(hexColor.titleColor)
                                .font(.system(size: 24))
                            
                            Text("HINTS")
                                .font(.custom("DIN-BlackAlternate",fixedSize: 17))
                                .foregroundColor(hexColor.fillColor)
                            
                        }
                        .frame(width: 182,height: 66)
                        .background(.white)
                        .shadow(color: .white,radius: 17, y: 2)
                        .cornerRadius(17)
                    })
                }
                
            }
           
            .frame(width: isHintShow ? 1134 : 182, height: isHintShow ? 445 : 66)
            .background(.white)
            .cornerRadius(17)
            .padding(30)
            
            
            
        }
        .shadow(color: isHintShow ? Color.black.opacity(0.4) : .clear, radius: 17, y: 2)
        

    }
}


