//
//  LetterGuessView.swift
//  Braillie
//
//  Created by Kai Shing Ng on 4/4/2023.
//

import SwiftUI

struct LetterGuessView: View {
    
    @StateObject var brailleDisplay = BrailleDisplay()
    @Binding var setting: Setting
    @State var angle: Double = 0
    var hexColor = ColorHex()
    @State var text = " "
    @State var isHintShow = false
    @State var isCorrect = false

    
    @State var inputText = BraillArticle(string: " ")
    
    var body: some View {
        ZStack{
            hexColor.bgColor.ignoresSafeArea()
            
        
            VStack{
               
                    HomeButton(setting: $setting, action: {
                        setting.isLetterGuessViewShow.toggle()
                        setting.isHomePageShow.toggle()
                    }).padding([.leading, .top], 15)
                    
                    HStack{
                        Text("LETTER GUESS")
                            .font(.custom("DIN-BlackAlternate",fixedSize: 34))
                            .foregroundColor(hexColor.titleColor)
                        Spacer()
                    }.padding()
                    
                    HStack{
                        HStack{
                            VStack{
                                Image(systemName:  "text.cursor")
                                    .foregroundColor(hexColor.hintColor)
                                    .font(.system(size: 24))
                                    .padding()
                                
                                Text(text)
                                    .font(.custom("DIN-BlackAlternate",fixedSize: 180))
                                    .foregroundColor(hexColor.fillColor)
                                    .frame(width: 311,height: 400)
                                    .background(hexColor.navbgColor)
                                    .shadow(color: .white,radius: 73, y: 2)
                                    .cornerRadius(73)
                                
                                
                            }
                            
                            Image(systemName: "arrow.right.arrow.left")
                                .foregroundColor(hexColor.hintColor)
                                .font(.system(size: 24))
                                .padding([.horizontal], 106)
                                .offset(y: 25)
                            
                            
                            
                            VStack{
                                Image(systemName: "hand.point.up.braille")
                                    .foregroundColor(hexColor.hintColor)
                                    .font(.system(size: 24))
                                    .padding()
                                
                                BrailleView(article: $inputText, mode: .letterGuess, scale: 5)
                                    .frame(width: 311,height: 400)
                                    .background(hexColor.navbgColor)
                                    .shadow(color: .white,radius: 73, y: 2)
                                    .cornerRadius(73)
                                
                                
                            }
                        }
                        
                        
                        ZStack {
                            
                            if isCorrect {
                                EmitterView()
                            }
                            VStack{
                                
                                Button(action: {
                                    inputText = BraillArticle(string: " ")
                                }, label: {
                                    Image(systemName: "arrow.counterclockwise.circle.fill")
                                        .foregroundColor(hexColor.hintColor)
                                        .font(.system(size: 35))
                                    
                                }).padding()
                                
                                
                                CheckButton(inputText: $inputText, text: $text, isCorrect: $isCorrect)
                                
                            }
                            
                            
                        }
                        .frame(width: 165, height: 200)
                        .offset(x: 5, y: 30)
                        
                        
                    }
                    //.padding(.bottom, 20)
                    .offset(x: 50)
                    
                    
                    Spacer()
                
                
                
                HStack{
                    
                        Spacer()
                        
                        Button(action: {
                            withAnimation(
                                .spring(
                                    response: 0.55,
                                    dampingFraction: 0.65,
                                    blendDuration: 0
                                )
                            ) {
                                text = setting.textArr.randomElement()!
                                inputText = BraillArticle(string: " ")
                            }
                            
                        }, label: {
                            Image("skip")
                                .frame(width: 182,height: 66)
                                .background(.white)
                                .shadow(color: .white,radius: 17, y: 2)
                                .cornerRadius(17)
                        })
                        
                    
                }.padding(30)
                
                
                
            }.padding()
            
            VStack{
                
                Spacer()
                HStack{
                    
                    HintView(isHintShow: $isHintShow)
                    Spacer()
                }
            }
            .frame(
                minWidth: 0,
                maxWidth: .infinity,
                minHeight: 0,
                maxHeight: .infinity,
                alignment: .center
            )
            .background(.black.opacity(isHintShow ? 0.2 : 0))
            .background(.ultraThinMaterial.opacity(isHintShow ? 0.9 : 0))
 
        }
        .onAppear{
            text = setting.textArr.randomElement()!
        }
        .environmentObject(brailleDisplay)
    }
}








