//
//  BraillePuzzleView.swift
//  Braillie
//
//  Created by Kai Shing Ng on 4/4/2023.
//

import SwiftUI

struct BraillePuzzleView: View {
    
    @StateObject var brailleDisplay = BrailleDisplay()
    @Binding var setting: Setting
    var gridItemLayout = [GridItem(.adaptive(minimum: 200))]
    
    //@State var question = "hello"
    @State var question = BraillArticle(string: "")
    @State var answer = [String](repeating: "", count: 7)
    //var question = words.randomElement()

    @State var canReplace = false
    @State var index = 0
    
    @State var btnFrame = [CGRect](repeating: .zero, count: 7)
    @State var firstRow = BraillArticle(string: String(Setting().engStr.prefix(13)))
    @State var secondRow = BraillArticle(string: String(Setting().engStr.suffix(13)))
    @State var isHintShow = false
    
    @State var isCorrect = false
    
    
    
    var hexColor = ColorHex()
    var body: some View {
        ZStack{
            
            hexColor.bgColor.ignoresSafeArea()
            
            
            
            VStack{
                
                VStack{
                    
                    HomeButton(setting: $setting, action: {
                        setting.isBraillePuzzleViewShow.toggle()
                        setting.isHomePageShow.toggle()
                    }).padding([.leading], 15)
                    
                    HStack{
                        Text("BRAILLE PUZZLE")
                            .font(.custom("DIN-BlackAlternate",fixedSize: 34))
                            .foregroundColor(hexColor.titleColor)
                        Spacer()
                    }.padding([.horizontal, .top], 20)
                    
                    HStack{
                        VStack{
                            Image(systemName: "text.cursor")
                                .foregroundColor(hexColor.hintColor)
                                .font(.system(size: 24))
                                .padding(.bottom, 45)
                            
                            Image(systemName: "hand.point.up.braille")
                                .foregroundColor(hexColor.hintColor)
                                .font(.system(size: 24))
                            
                        }.padding()
                        //LazyVGrid(columns: gridItemLayout) {
                        ForEach(0..<question.characters.count, id:\.self) {
                            i in
                            VStack{
                                Text(question.characters[i].character)
                                    .textCase(.uppercase)
                                    .font(.custom("DIN-BlackAlternate",fixedSize: 60))
                                    .foregroundColor(hexColor.fillColor)
                                    .padding(.bottom, -1)
                                
                                VStack{
                                    if answer[i] == "" {
                                        Text("")
                                            .frame(width: 67,height: 87)
                                            .background(.white)
                                            .cornerRadius(17)
                                            .overlay(
                                                RoundedRectangle(cornerRadius: 17)
                                                    .stroke(canReplace && i == index ? hexColor.hintColor : hexColor.borderColor, lineWidth: canReplace && i == index ? 2 : 1)
                                            )
                                        
                                    }else{
                                        BrailleView(article: Binding.constant(BraillArticle(string: answer[i])), mode: .braillePuzzle, scale: 1)
                                            .padding(-12.5)
                                    }
                                    
                                }
                                //.background(.yellow)
                                .overlay(
                                    GeometryReader(content: { geometry in
                                        Color.clear
                                            .onAppear(perform: {
                                                
                                                self.btnFrame[i] = geometry.frame(in: .global)
                                                
                                            })
                                            .onChange(of: question.article, perform: { _ in
                                                self.btnFrame[i] = geometry.frame(in: .global)
                                            })
                                    })
                                    
                                )
                                
                                
                            }.padding(-1)
                            
                            
                        }
                    
                        ZStack{
                            
                            
                            HStack{
                                
                                CheckButton2(isCorrect: $isCorrect, question: $question, firstRow: $firstRow, secondRow: $secondRow, answer: $answer, btnFrame: $btnFrame)
                                
                                Button(action: {
                                    answer = [String](repeating: "", count: question.characters.count)
                                }, label: {
                                    Image(systemName: "arrow.counterclockwise.circle.fill")
                                        .foregroundColor(hexColor.hintColor)
                                        .font(.system(size: 35))
                                        .padding(-5)
                                })
                                
                                
                                
                                
                            }
                            .offset(x: -20, y: 40)
                            
                            if isCorrect{
                                EmitterView()
                            }
                            
                        }.frame(width: 190)
                        
                        
                    }
                    
                    .padding(.top, -20)
                    .offset(x: 63)
                    
                   
                }
                .padding()
                
                //.background(.ultraThickMaterial)
                
                
                
                
                
                VStack{
                    
                    ZStack{
                        Text("Drag the braille to the right place.")
                            .font(.custom("DIN-MediumAlternate", fixedSize: 17))
                            .foregroundColor(ColorHex().hintColor)
                           
                        
                        HStack{
                            Spacer()
                            Button(action: {
                                let randomString = setting.engStr.shuffled()
                                firstRow = BraillArticle(string: String(randomString.prefix(13)))
                                secondRow = BraillArticle(string: String(randomString.suffix(13)))
                                
                            }, label: {
                                Image(systemName: "shuffle.circle.fill")
                                    .font(Font.system(size: 24))
                                    .foregroundColor(hexColor.titleColor)
                                Text("Randomlize")
                                    .textCase(.uppercase)
                                    .font(.custom("DIN-BlackAlternate",fixedSize: 17))
                                    .foregroundColor(hexColor.fillColor)
                            })
                        }
                    }.padding(.horizontal, 36)
                    
                    VStack{
                        BrailleView(article: $firstRow, isBraillePuzzle: true, mode: .braillePuzzle, scale: 1, onChanged: self.brailleMoved, onEnded: self.brailleDropped)
                        
                        HStack{
                            Image(systemName: "flashlight.on.fill")
                                .foregroundColor(hexColor.hintColor)
                            
                            Image("bar")
                                .gesture(
                                    DragGesture(minimumDistance: 1, coordinateSpace: .global)
                                        .onChanged {
                                            value in
                                            var pos = value.location
                                            
                                            pos.y -= 100
                                            
                                            firstRow.touch(pos, for: .braillePuzzle)
                                            
                                        }
                                    
                                    
                                        .onEnded{
                                            value in
                                            
                                            firstRow.reset()
                                            
                                        }
                                )
                        }
                        BrailleView(article: $secondRow, isBraillePuzzle: true, mode: .braillePuzzle, scale: 1, onChanged: self.brailleMoved, onEnded: self.brailleDropped)
                        //.padding(-12.5)
                        
                        
                        HStack{
                            Image(systemName: "flashlight.on.fill")
                                .foregroundColor(hexColor.hintColor)
                            
                            Image("bar")
                                .gesture(
                                    DragGesture(minimumDistance: 1, coordinateSpace: .global)
                                        .onChanged {
                                            value in
                                            var pos = value.location
                                            
                                            pos.y -= 100
                                            
                                            secondRow.touch(pos, for: .braillePuzzle)
                                            
                                        }
                                    
                                    
                                        .onEnded{
                                            value in
                                            
                                            secondRow.reset()
                                            
                                        }
                                )
                            
                            
                        }
                        
                        Spacer()
                        ZStack{
                            HStack(){
                                Image(systemName: "flashlight.on.fill")
                                    .font(.system(size: 24))
                                Text("Drag slowly on the track to reveal the alphabet.")
                                    .font(.custom("DIN-MediumAlternate",fixedSize: 17))
                            }
                            .foregroundColor(hexColor.hintColor)
                            
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
                                        
                                        reset()
                                        
                                    }
                                    
                                }, label: {
                                    Image("skip")
                                        .frame(width: 182,height: 66)
                                        .background(.white)
                                        .shadow(color: .white,radius: 17, y: 2)
                                        .cornerRadius(17)
                                }).padding(30)
                                
                            }
                        }
                    }
                }
                .padding(.top, 40)
                .frame(
                    minWidth: 0,
                    maxWidth: .infinity,
                    minHeight: 0,
                    maxHeight: 475,
                    alignment: .center
                )
                .background(hexColor.navbgColor)
                .frame(height: 475)
            }
            
            
            
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
            .offset(y: 20)
            .background(.black.opacity(isHintShow ? 0.2 : 0))
            .background(.ultraThinMaterial.opacity(isHintShow ? 0.9 : 0))
            
            
        }
        .onAppear(perform: {
            reset()
            
        })
        .environmentObject(brailleDisplay)
        
    }
    
    func reset(){
        let randomString = setting.engStr.shuffled()
        question = BraillArticle(string: setting.words.randomElement()!)
        firstRow = BraillArticle(string: String(randomString.prefix(13)))
        secondRow = BraillArticle(string: String(randomString.suffix(13)))
        answer = [String](repeating: "", count: question.characters.count)
        btnFrame = [CGRect](repeating: .zero, count: question.characters.count)
    }
    
    func brailleMoved(location: CGPoint, braille: String) -> DragState {
        
        //print(location)
        if let match = btnFrame.firstIndex(where: {$0.contains(location)}){
            var testLetters = answer
            testLetters[match] = braille
            index = match
            canReplace = true
           
            return .canReplace
            
            
            
        }else{
            canReplace = false
            return .nothing
        }
    }
    
    func brailleDropped(location: CGPoint, Index: Int, braille: String ){

        //print(btnFrame)
        print(location)
        if let match = btnFrame.firstIndex(where: {$0.contains(location)}){
            answer[match] = braille
        }
       
    }
    
    
    
}
    



