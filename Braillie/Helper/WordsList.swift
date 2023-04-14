//
//  wordsList.swift
//  Braillie
//
//  Created by Kai Shing Ng on 9/4/2023.
//

import SwiftUI

struct WordsList: View {
    @Binding var words: [String]
//    @State var words = ["ss","ss","sff"]
    var hexColor = ColorHex()
    @Binding var isListShow: Bool
    
    var body: some View {
        
        ZStack{
            VStack{
                
                ZStack{
                    Text("Words")
                        .textCase(.uppercase)
                        .font(.custom("DIN-BlackAlternate",fixedSize: 17))
                        .foregroundColor(hexColor.fillColor)
                    HStack{
                        
                        Spacer()
                        
                        Button(action: {
                            withAnimation(
                                .spring()
                            ) {
                                isListShow.toggle()
                                
                            }
                        }, label: {
                            Label("", systemImage: "xmark.circle.fill")
                                .font(.system(size: 24))
                                .foregroundColor(hexColor.titleColor)
                        })
                        
                    }
                }
                Divider()
                    .overlay(Color.white.opacity(0.75))
                    .onAppear(){
                        print(words)
                    }
                
                if words != [""] && words.count != 0{
                    List{
                        ForEach($words, id:\.self, editActions: .delete){ $word in
                            if word != "" {
                                HStack{
                                    Text(word)
                                        .foregroundColor(hexColor.fillColor)
                                        .font(.custom("DIN-BlackAlternate",fixedSize: 15))
                                    Spacer()
                                }
                                .listRowBackground(hexColor.navbgColor)
                            }
                            
                        }
                        
                        
                    }
                    .scrollContentBackground(.hidden)
                    .background(.white)
                    .frame(width: 480)
                }else{
                    Color.white.ignoresSafeArea()
                }
                
            }
            .padding(10)
            .frame(width: 540, height: 620)
            
            .background(.white)
            .cornerRadius(13)
            
            
            
        }
        .shadow(color: isListShow ? Color.black.opacity(0.4) : .clear, radius: 17, y: 2)
        
        
        
    }
}

