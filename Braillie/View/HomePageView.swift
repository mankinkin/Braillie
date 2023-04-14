//
//  HomePageView.swift
//  Braillie
//
//  Created by Kai Shing Ng on 30/3/2023.
//

import SwiftUI

struct HomePageView: View {
    
    @StateObject var brailleDisplay = BrailleDisplay()
    @Binding var setting: Setting
    
    @State var isAboutShow = false
    
    var title = "MYSTERY TEXT"
    var modes = ["type To Braille", "flash Card", "Letter Guess", "Braille Puzzle"]
    var hint = "Drag slowly on the braille to reveal the alphabet."
    var hexColor = ColorHex()
    
    
    
    var body: some View {
        
        ZStack{
            Color.init(hex: "EFF1F4").ignoresSafeArea()
            
            
                VStack(alignment: .center) {
                    if !isAboutShow{
                    
                    Image("logo2").padding()
                    
                    HStack{
                        
                        ForEach(setting.modes, id: \.self) { mode in
                            VStack{
                                Text(mode)
                                    .font(.custom("DIN-BlackAlternate",fixedSize: 24))
                                    .foregroundColor(hexColor.fillColor)
                                    .textCase(.uppercase)
                                    .padding(-5)
                                
                                
                                ImageButton(mode: mode,setting: $setting)
                                
                                if mode == setting.modes[0] {
                                    
                                    VStack(alignment: .center){
                                        
                                        BrailleGridView(article: "type to".braille,mode: .display, scale: 0.3, bottom_padding: -65,needEmptyDot: false, gridItemLayout: [GridItem(.adaptive(minimum: 17))]).frame(width: 200)
                                        BrailleGridView(article: "Braille".braille,mode: .display, scale: 0.3, needEmptyDot: false, gridItemLayout: [GridItem(.adaptive(minimum: 17))]).frame(width: 200)
                                    }
                                    .padding([.top], -30)
                                }else if mode == setting.modes[1] {
                                    VStack(alignment: .center){
                                        BrailleGridView(article: "FLASH".braille,mode: .display, scale: 0.3, bottom_padding: -65,needEmptyDot: false, gridItemLayout: [GridItem(.adaptive(minimum: 17))]).frame(width: 160)
                                        BrailleGridView(article: "CARD".braille,mode: .display, scale: 0.3, bottom_padding: -65,needEmptyDot: false, gridItemLayout: [GridItem(.adaptive(minimum: 17))]).frame(width: 140)
                                        
                                    }
                                    .padding([.top], -30)
                                }else if mode == setting.modes[2] {
                                    VStack(alignment: .center){
                                        BrailleGridView(article: "Letter".braille,mode: .display, scale: 0.3, bottom_padding: -65,needEmptyDot: false, gridItemLayout: [GridItem(.adaptive(minimum: 17))]).frame(width: 180)
                                        BrailleGridView(article: "GUESS".braille,mode: .display, scale: 0.3, bottom_padding: -65,needEmptyDot: false, gridItemLayout: [GridItem(.adaptive(minimum: 17))]).frame(width: 160)
                                        
                                    }
                                    .padding([.top], -30)
                                    
                                }else{
                                    VStack(alignment: .center){
                                        BrailleGridView(article: "Braille".braille,mode: .display, scale: 0.3, bottom_padding: -65,needEmptyDot: false, gridItemLayout: [GridItem(.adaptive(minimum: 17))]).frame(width: 200)
                                        BrailleGridView(article: "Puzzle".braille,mode: .display, scale: 0.3, needEmptyDot: false, gridItemLayout: [GridItem(.adaptive(minimum: 17))]).frame(width: 180)
                                    }
                                    .padding([.top], -30)
                                }
                                Spacer()
                                
                            }
                            
                        }
                    }
                }
                HStack{
                    
                    AboutView(isAboutShow: $isAboutShow).padding(.trailing, isAboutShow ? 0 : -330 )
                    
                    if !isAboutShow{
                        Spacer()
                        HStack(){
                            Image(systemName: "flashlight.on.fill")
                            Text(hint)
                                .font(.custom("DIN-MediumAlternate",fixedSize: 17))
                        }
                        .foregroundColor(hexColor.hintColor)
                        .offset(y: 5)
                    }
                    Spacer()
                }.padding()
                
                
            }
            
        }.environmentObject(brailleDisplay)
    }
    
    
}

