//
//  AboutView.swift
//  Braillie
//
//  Created by Kai Shing Ng on 13/4/2023.
//

import SwiftUI

struct AboutView: View {
    @Binding var isAboutShow: Bool
    @State var isNextPage = false
    
    var hexColor = ColorHex()
    
    var body: some View {
        
        
        ZStack{
            //Image("").blur(radius: 10).ignoresSafeArea()
            
            if isAboutShow{
                Color.white.ignoresSafeArea()
            }
            VStack{
                if isAboutShow{
                    HStack{
                        Spacer()
                        Button(action: {
                            withAnimation(
                                .spring()
                            ) {
                                isAboutShow.toggle()
                                
                            }
                        }, label: {
                            Image(systemName: "xmark.circle.fill")
                                .font(.system(size: 24))
                                .foregroundColor(hexColor.titleColor)
                        })
                        
                    }
                    .padding(30)
                    
                    ZStack{
                        VStack{
                            if !isNextPage {
                                BrailleIntro()
                            }else{
                                ExperienceIntro().padding(.leading, 40)
                            }
                            
                        
                            
                        }.padding([.horizontal],50)
                        
                            
                        HStack{
                            if !isNextPage {
                                Spacer()
                            }
                            Button(action: {
                                withAnimation(
                                    .spring()
                                ) {
                                    
                                    isNextPage.toggle()
                                    
                                    
                                }
                            }, label: {
                                Image(systemName: isNextPage ? "chevron.compact.left" : "chevron.compact.right")
                                    .foregroundColor(hexColor.hintColor)
                                    .font(.system(size: 50))
                                    
                                    
                            })
                            .padding(.horizontal, isNextPage ? 15 : -50)
                            .offset(y: -40)
                            
                            if isNextPage {
                                Spacer()
                            }
                        }.padding()
                        
                    }
                    Spacer()
                    HStack{
                        Circle()
                            .fill(isNextPage ? hexColor.hintColor : hexColor.titleColor)
                            .frame(width: isNextPage ? 6 : 7, height: isNextPage ? 6 : 7)
                        
                        Circle()
                            .fill(isNextPage ?  hexColor.titleColor : hexColor.hintColor)
                            .frame(width: isNextPage ? 7 : 6, height: isNextPage ? 7 : 6)
                    }
                    .padding(.bottom, 30)
                    
                }else{
                    Button(action: {
                        withAnimation(
                            .spring()
                        ) {
                            isAboutShow.toggle()
                        }
                        //isHintShow.toggle()
                    }, label: {
                        HStack{
                            Image("aboutIcon")
                                .resizable()
                                .frame(width: 20, height: 22)
                            
                            Text("ABOUT")
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
            .frame(width: isAboutShow ? 1134 : 182, height: isAboutShow ? 772 : 66)
            .background(.white)
            .cornerRadius(17)
            .padding(30)
        }
        .shadow(color: isAboutShow ? Color.black.opacity(0.4) : .clear, radius: 17, y: 2)
        .background(.ultraThinMaterial.opacity(isAboutShow ? 1 : 0))
        

    }
}
