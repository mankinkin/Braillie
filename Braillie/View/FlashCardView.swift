//
//  FlashCardView.swift
//  Braillie
//
//  Created by Kai Shing Ng on 4/4/2023.
//

import SwiftUI

struct FlashCardView: View {
    
    @Binding var setting: Setting
    @State var words = [""]
    @State var index = 0
    @StateObject var brailleDisplay = BrailleDisplay()
    @State var inputText = [BraillArticle(string: ""), BraillArticle(string: ""), BraillArticle(string: "")]
    @State var isNext = false
    @State var isAlphabetShow = true
    @State var isWordListShow = false
    var hexColor = ColorHex()
    
    
    var body: some View {
        ZStack{
            hexColor.bgColor.ignoresSafeArea()
            
            VStack(){
                HomeButton(setting: $setting, action: {
                    setting.isFlashCardViewShow.toggle()
                    setting.isHomePageShow.toggle()
                }).padding([.leading], 15)
                
                
                HStack(){
                    Text("Flash card")
                        .textCase(.uppercase)
                        .font(.custom("DIN-BlackAlternate",fixedSize: 34))
                        .foregroundColor(hexColor.titleColor)
                    Spacer()
                    
                    Button(action: {
                        isWordListShow.toggle()
                        
                    }, label: {
                        Image(systemName: "gearshape.circle.fill")
                            .font(Font.system(size: 24))
                            .foregroundColor(hexColor.titleColor)
                        Text("Manage words")
                            .textCase(.uppercase)
                            .font(.custom("DIN-BlackAlternate",fixedSize: 17))
                            .foregroundColor(hexColor.fillColor)
                        
                    })
                    
                    
                }.padding()
                
                ZStack(alignment: .bottom){
                    ForEach(0..<3, id: \.self){ i in
                        
                        FlashCard(isNext: $isNext, index: i, inputText: $inputText[2-i], isAlphabetShow: isAlphabetShow)
                    }
                    
                    
                    
                }
                
                Spacer()
                
                ZStack{
                    
                    HStack(){
                        Image(systemName: "water.waves")
                            .foregroundColor(hexColor.hintColor)
                        Text("Drag slowly on the braille to feel the haptic.")
                            .font(.custom("DIN-MediumAlternate",fixedSize: 17))
                    }
                    .foregroundColor(hexColor.hintColor)
              
                    
                    HStack{
                        HStack{
                            Toggle("", isOn: $isAlphabetShow)
                                .frame(width: 50)
                                .padding(10)
                            
                            Text("Show alphabet")
                                .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                                .foregroundColor(hexColor.hintColor)
                            
                        }
                        .padding()
                        .frame(width: 230,height: 66)
                        .background(.white)
                        .shadow(color: .white,radius: 17, y: 2)
                        .cornerRadius(17)
                        
                        
                        Spacer()
                        
                        Button(action: {
                            
                            if !isNext {
                                withAnimation(.timingCurve(0.5, 0, 0.5, 1, duration: 0.5)){
                                    isNext.toggle()
                                }
                                
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                                    isNext.toggle()
                                    
                                    index += 1
                                    if index == words.count {
                                        index = 0
                                    }
                                    
                                    reload()
                                }
                                
                            }
                            
                        }, label: {
                            Image("next")
                                .frame(width: 182,height: 66)
                                .background(.white)
                                .shadow(color: .white,radius: 17, y: 2)
                                .cornerRadius(17)
                        })
                        
                        
                    }.padding(.horizontal, 30)
                    
                }.padding()
            }.padding()
            
            if isWordListShow {
                ZStack{
                    WordsList(words: $words, isListShow: $isWordListShow)
                }
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: .infinity,
                    alignment: .center
                )
                .background(.black.opacity(isWordListShow ? 0.2 : 0))
                .background(.ultraThinMaterial.opacity(isWordListShow ? 0.9 : 0))
                .onDisappear(){
                    UserDefaults.standard.set(words, forKey: "words")
                    index = 0
                    reload()
                }
            }
        }
        .environmentObject(brailleDisplay)
        .onAppear(){
            if let loadedArray = UserDefaults.standard.array(forKey: "words") as? [String] {
                words = loadedArray
                //inputText[1].article = words[1]
                words.shuffle()
                reload()
                
            } else {
                words = ["Hello"]
                words.shuffle()
                reload()
            }
            
        }
    }
    
    func reload(){
        for i in 0..<3 {
            if index + i < words.count {
                inputText[i].article = words[index+i]
            }else{
                inputText[i].article = ""
            }
        }
        
    }
}

