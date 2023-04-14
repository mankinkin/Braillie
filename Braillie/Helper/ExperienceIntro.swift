//
//  ExperienceIntro.swift
//  Braillie
//
//  Created by Kai Shing Ng on 13/4/2023.
//

import SwiftUI

struct ExperienceIntro: View {
    
    var hexColor = ColorHex()
    @State var HI = "hi".braille
    @State var HI2 = "hi".braille
    
    var body: some View {
        VStack{
            HStack{
                Text("The Experience")
                    .textCase(.uppercase)
                    .font(.custom("DIN-BlackAlternate",fixedSize: 34))
                    .foregroundColor(hexColor.titleColor)
                Spacer()
            }
            .padding(.vertical, 7)
            //.padding(.bottom, 10)
            
            
            
            
            HStack{
                Text("Braillie tries to bring")
                    .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                    .foregroundColor(ColorHex().fillColor)
                Text("the experience of reading braille")
                    .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                    .foregroundColor(ColorHex().titleColor)
                    .padding(.horizontal, -3)
                Text("to the public through an iPad,")
                    .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                    .foregroundColor(ColorHex().fillColor)
                Spacer()
                
            }
            HStack{
                Text("to increase people’s awareness of braille.")
                    .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                    .foregroundColor(ColorHex().fillColor)
                Spacer()
            }
            .padding(.bottom, 1)
            
            HStack{
                Text("Reading braille requires touch.")
                    .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                    .foregroundColor(ColorHex().titleColor)
                Spacer()
            }
            
            HStack{
                Text("When users lightly touch the braille on the screen with their fingers,")
                    .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                    .foregroundColor(ColorHex().fillColor)
                
                
                Spacer()
            }
            HStack{
                Text("Braillie will use the following methods to give users the experience.")
                    .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                    .foregroundColor(ColorHex().fillColor)
                
                
                Spacer()
            }
            
        }
        
        HStack{
            
            Image(systemName: "water.waves")
                .foregroundColor(hexColor.hintColor)
                .font(.system(size: 76))
                .padding([.vertical, .leading], 40)
            
            
            VStack{
                HStack{
                    Text("Haptic simulation")
                        .textCase(.uppercase)
                        .font(.custom("DIN-BlackAlternate",fixedSize: 21))
                        .foregroundColor(hexColor.titleColor)
                    
                    Spacer()
                }.padding(.bottom, 2)
                HStack{
                    Text("Through the built-in speaker of the iPad,")
                        .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                        .foregroundColor(ColorHex().fillColor)
                    
                    
                    Spacer()
                }
                HStack{
                    Text("when users touch the braille,")
                        .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                        .foregroundColor(ColorHex().fillColor)
                    
                    
                    Spacer()
                }
                HStack{
                    Text("different")
                        .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                        .foregroundColor(ColorHex().fillColor)
                    Text("low-frequency sounds")
                        .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                        .foregroundColor(ColorHex().titleColor)
                        .padding(.horizontal, -3)
                    Text("are emitted,")
                        .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                        .foregroundColor(ColorHex().fillColor)
                    Spacer()
                }
                
                HStack{
                    Text("allowing users to")
                        .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                        .foregroundColor(ColorHex().fillColor)
                    
                    Text("feel feedback on the glass surface")
                        .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                        .foregroundColor(ColorHex().titleColor)
                        .padding(.leading, -3)
                        .padding(.trailing, -8)
                    
                    Text(".")
                        .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                        .foregroundColor(ColorHex().fillColor)
                    
                    Spacer()
                }
            }.padding()
            
            VStack{
                HStack{
                    Text("Try it!")
                        .foregroundColor(.white)
                        .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                        .padding(35)
                    BrailleView(article: $HI, isHaptic: true, mode: .about, scale: 1)
                }
                .padding(.bottom, -15)
                
                HStack(){
                    Image(systemName: "water.waves")
                        .font(.system(size: 17))
                    
                    Text("Drag slowly on the braille to feel the haptic.")
                        .font(.custom("DIN-MediumAlternate",fixedSize: 13))
                }
                .padding(.bottom, 15)
                .foregroundColor(.white)
                
            }
            .frame(width: 352, height: 138)
            .background(hexColor.borderColor)
            .cornerRadius(49)
            .overlay(
                RoundedRectangle(cornerRadius: 49)
                    .stroke(hexColor.borderColor, lineWidth: 1)
            )
            .padding(15)
            
            
            
        }
        .frame(width: 995, height: 168)
        .background(.white)
        .cornerRadius(49)
        .overlay(
            RoundedRectangle(cornerRadius: 49)
                .stroke(hexColor.borderColor, lineWidth: 1)
        )
        .padding(.top, 10)
        
        
        HStack{
            Image(systemName: "flashlight.on.fill")
                .foregroundColor(hexColor.hintColor)
                .font(.system(size: 76))
                .padding(.vertical, 40)
                .padding(.leading, 60)
                .padding(.trailing, 20)
            
            
            VStack{
                HStack{
                    Text("revealing alphabets")
                        .textCase(.uppercase)
                        .font(.custom("DIN-BlackAlternate",fixedSize: 21))
                        .foregroundColor(hexColor.titleColor)
                    
                    Spacer()
                }.padding(.bottom, 2)
                HStack{
                    Text("When users touch the braille on the screen,")
                        .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                        .foregroundColor(ColorHex().fillColor)
                    
                    
                    Spacer()
                }
               
                HStack{
                    Text("the")
                        .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                        .foregroundColor(ColorHex().fillColor)
                    Text("corresponding English letters will gradually appear")
                        .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                        .foregroundColor(ColorHex().titleColor)
                        .padding(.leading, -3)
                        .padding(.trailing, -8)
                    Text(",")
                        .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                        .foregroundColor(ColorHex().fillColor)
                    Spacer()
                }
                
                HStack{
                    Text("allowing users to learn.")
                        .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                        .foregroundColor(ColorHex().fillColor)
                    
                    
                    Spacer()
                }
            }.padding()
            
            VStack{
                HStack{
                    Text("Try it!")
                        .foregroundColor(.white)
                        .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                        .padding(35)
                    BrailleView(article: $HI2, mode: .about, scale: 1)
                }
                .padding(.bottom, -15)
                
                HStack(){
                    Image(systemName: "flashlight.on.fill")
                        .font(.system(size: 17))
                    
                    Text("Drag on the braille to reveal the alphabet.")
                        .font(.custom("DIN-MediumAlternate",fixedSize: 13))
                }
                .padding(.bottom, 15)
                .foregroundColor(.white)
                
            }
            .frame(width: 352, height: 138)
            .background(hexColor.borderColor)
            .cornerRadius(49)
            .overlay(
                RoundedRectangle(cornerRadius: 49)
                    .stroke(hexColor.borderColor, lineWidth: 1)
            )
            .padding(15)
        }
        
        .frame(width: 995, height: 168)
        .background(.white)
        .cornerRadius(49)
        .overlay(
            RoundedRectangle(cornerRadius: 49)
                .stroke(hexColor.borderColor, lineWidth: 1)
        ).padding(.bottom, 20)
        
        
        
        HStack{
            Text("Of course, the braille experience cannot be completely replicated on a flat glass surface,")
                .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                .foregroundColor(ColorHex().fillColor)
            
            
            Spacer()
        }
        HStack{
            Text("but through the above two designs, the general public can understand and learn braille with just an iPad.")
                .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                .foregroundColor(ColorHex().fillColor)
            
            
            Spacer()
        }
    }
}
