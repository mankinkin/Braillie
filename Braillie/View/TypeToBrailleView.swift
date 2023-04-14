//
//  TypeToBraillieView.swift
//  Braillie
//
//  Created by Kai Shing Ng on 4/4/2023.
//

import SwiftUI

struct TypeToBrailleView: View {
    @StateObject var brailleDisplay = BrailleDisplay()
    var hexColor = ColorHex()
    @Binding var setting: Setting
    @State var inputText = BraillArticle(string: "")
    @FocusState private var isFocused: Bool
    @State private var words: [String] = []

    
    
    var body: some View {
        ZStack{
            hexColor.bgColor.ignoresSafeArea()
            
            VStack(){
                HomeButton(setting: $setting, action: {
                    isFocused = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.00001) {
                        setting.isTypeToBrailleViewShow.toggle()
                        setting.isHomePageShow.toggle()
                        
                    }
                    
                }).padding([.leading], 15)
                
                
                HStack(){
                    Text("TYPE TO BRAILLE")
                        .font(.custom("DIN-BlackAlternate",fixedSize: 34))
                        .foregroundColor(hexColor.titleColor)
                    Spacer()
                    
                    Button(action: {
                        if inputText.article != "" {
                            if words.count == 0 || words[0] != "" {
                                words.append(inputText.article)
                            }else{
                                words[0] = inputText.article
                            }
                            UserDefaults.standard.set(words, forKey: "words")
                            inputText.article = ""
                        }
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .font(Font.system(size: 24))
                            .foregroundColor(hexColor.titleColor)
                        Text("Add to Flash Card")
                            .textCase(.uppercase)
                            .font(.custom("DIN-BlackAlternate",fixedSize: 17))
                            .foregroundColor(hexColor.fillColor)
                    })
                    
                }.padding([.top, .leading, .trailing], 20)
                VStack{
                    VStack{
                        Image(systemName: "hand.point.up.braille")
                            .foregroundColor(hexColor.hintColor)
                            .font(Font.system(size: 24))
                            .padding(.top, 10)
                        
                        HStack(){
                            Image(systemName: "water.waves")
                                .foregroundColor(hexColor.hintColor)
                                .font(Font.system(size: 24))
                                .padding()
                            
                            BrailleView(article: $inputText, scale: 0.8)
                            //.padding([.top,.bottom], 150)
                            
                                .frame(width: 716,height: 92)
                                .background(hexColor.navbgColor)
                                .cornerRadius(17)
                            
                            
                            
                        }.padding(.bottom,30)
                        
                        HStack{
                            Button(action: {
                                withAnimation(.easeInOut(duration: 0.5)){
                                    isFocused.toggle()
                                }
                            }, label: {
                                Label("", systemImage: "keyboard")
                                    .font(Font.system(size: 24))
                                    .foregroundColor(hexColor.hintColor)
                            })
                            
                            TextField("Braille", text: $inputText.article)
                                
                                .foregroundColor(hexColor.fillColor)
                                .font(.custom("DIN-BlackAlternate",fixedSize: 24))
                                .focused($isFocused)
                                .onChange(of: inputText.article) { article in
                                    if article.count > 8 {
                                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.00001) {
                                            inputText.article = String(article.prefix(8))
                                        }
                                    }
                                }
                            
                                
                            Spacer()
                            Button(action: {
                                inputText.article = ""
                            }, label: {
                                if inputText.article != "" {
                                    Image(systemName: "multiply.circle.fill")
                                        .font(Font.system(size: 24))
                                        .foregroundColor(hexColor.titleColor)
                                }
                                
                            })
                            
                            
                            
                        }
                        .padding()
                        .frame(width: 590,height: 50)
                        .background(.white)
                        .cornerRadius(17)
                        .overlay(
                            RoundedRectangle(cornerRadius: 17)
                                .stroke(hexColor.borderColor, lineWidth: 1)
                        )
                    }
                }.offset(y: isFocused ? 0 : 100)
                Spacer()
            }.padding()
            
            
        }
        .environmentObject(brailleDisplay)
        .onAppear(){
            if let loadedArray = UserDefaults.standard.array(forKey: "words") as? [String] {
                words = loadedArray
            }
            isFocused.toggle()
        }
        
    }
}


