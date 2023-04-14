//
//  BrailleCharView.swift
//  Braillie
//
//  Created by Yu Ho Kwok on 23/3/2023.
//

import SwiftUI

enum DragState{
    case canReplace
    case nothing
}


/// A view that show a single braille character
struct BrailleCharView: View {
    
   
    //this braile article
    @Binding var article : BraillArticle
    //present crash
    var position : Int
    //the braille character to display
    @Binding var character : BrailleCharacter
    //the braille mode - display or experience
    var mode : BrailleView.Mode
    //scale of the braille tile
    var scale = 1.0
    
    @State var isRotate = false
    @State private var dragOffset = CGSize.zero
    @State private var dragState = DragState.nothing

    var onChanged: ((CGPoint, String) -> DragState)?
    var onEnded: ((CGPoint, Int, String) -> Void)?
    
    var hexColor = ColorHex()
    var index:Int?
    
    var isHaptic = false
    
    
     
    
    
    @EnvironmentObject var brailleDisplay: BrailleDisplay
    
    var body: some View {
        ZStack {

            if mode == .display {

                HStack(spacing:5 * scale){
                    ForEach(0...1, id:\.self) {
                        i in
                        VStack(spacing: 0) {
                            ForEach(0...2, id:\.self) {
                                j in
                                
                                let index = i * 3 + (j)
                                
                                if brailleDisplay.displayLevel >= 1 {
                                    Circle()
                                        .strokeBorder(character.dots[index] == 1 ? hexColor.fillColor : hexColor.borderColor, lineWidth: 1)
                                        .background(
                                            Circle().fill(character.dots[index] == 1 ? hexColor.fillColor : .white)
                                        )
                                        .frame(width: 10 * scale)
                                        .padding(5 * scale)
                                        .opacity(0.0)
                                    
                                } else {
                                    Circle()
                                        .strokeBorder(character.dots[index] == 1 ? hexColor.fillColor : hexColor.borderColor, lineWidth: 1)
                                        .background(
                                            Circle().fill(character.dots[index] == 1 ? hexColor.fillColor : .white)
                                        )
                                        .frame(width: 10 * scale)
                                        .padding(5 * scale)
                                        .opacity(character.consumed[0] == 1 ? 0.5 : 1)
                                        .animation(.easeOut(duration: 0.5), value: character.consumed[0])
                                    
                                }
                            }
                        }
                    }
                }
                .padding()
                .background( character.consumed[0] == 1 ? .gray.opacity(0.05) : .gray.opacity(0.01))
                .animation(.easeOut(duration: 1.0), value: character.consumed[0])
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay (
                    GeometryReader(content: {
                        geometry in
                        Color.clear.onAppear(){
                            character.frames[0] = geometry.frame(in: .global)
                        }
                    })
                )
                
                if brailleDisplay.displayLevel == 0 {
                    Text("\(character.character)")
                        .foregroundColor(.black)
                        .font(Font.system(size: 65 * scale)).fontWeight(.semibold)
                        .opacity(character.consumed[0] == 1 ? 1.0 : 0.0)
                        .padding()
                        //.background(.clear.opacity(character.consumed[0] == 1 ? 1.0 : 0.0))
                        .animation(.easeOut(duration: 1.0), value: character.consumed[0])
                } else if brailleDisplay.displayLevel >= 1 {
                    Text("\(character.character)")
                        .font(Font.system(size: 65 * scale)).fontWeight(.semibold)
                }
                
            }else if mode == .letterGuess{
                
                HStack(spacing:5 * scale){
                    ForEach(0...1, id:\.self) {
                        i in
                        VStack(spacing: 0) {
                            ForEach(0...2, id:\.self) {
                                j in
                                
                                let index = i * 3 + (j)
                                
                                Button(action: {
                                    character.dots[index] = character.dots[index] == 1 ? 0 : 1
                                }, label: {
                                    Dot(isFill: character.dots[index] == 1, scale: scale,lineWidth: 3)
                                })
                                    
                                    
                            }
                        }
                    }
                }
                .padding()
                //.shadow(color: .white,radius: 10 * scale, y: 2)
                //.blur(radius: 0.4)
                //.background(hexColor.bgColor)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10 * scale)
                )
                
            }else if mode == .braillePuzzle{
                HStack(spacing:5 * scale){
                    ForEach(0...1, id:\.self) {
                        i in
                        VStack(spacing: 0) {
                            ForEach(0...2, id:\.self) {
                                j in
                                
                                let index = i * 3 + (j)
                                
                                
                                Dot(isFill: character.dots[index] == 1, scale: scale,lineWidth: 1)
                            
                                    
                                    
                            }
                        }
                    }
                }
                .frame(width: 66,height: 87)
                .background(hexColor.navbgColor)
                .cornerRadius(17)
                .shadow(color: isRotate ? hexColor.fillColor.opacity(0.25) : .clear ,radius: 25, y: 2)
                .overlay(
                    RoundedRectangle(cornerRadius: 17)
                        .stroke(hexColor.borderColor, lineWidth: 1)
                    
                )
                .overlay(
                    GeometryReader(content: {
                        geometry in
                        Color.clear.onChange(of: article.article){ _ in
                            character.frames[0] = geometry.frame(in: .global)
                        }
                    })
                )
                
                .padding(-3)
                .rotationEffect(Angle(degrees: isRotate ? -20 : 0), anchor: .center)
                .offset(dragOffset)
                .animation(.easeInOut(duration: 0.5), value: dragOffset)
                .gesture(
                    DragGesture(coordinateSpace: .global)
                        .onChanged {
                            
                            self.dragOffset = CGSize(width: $0.translation.width, height: $0.translation.height)
                            
                            if !isRotate {
                                withAnimation(.timingCurve(0.5, 0, 0.5, 1, duration: 0.3)){
                                    isRotate = true
                                }
                            }
                            
                            self.dragState = self.onChanged?($0.location, self.character.character) ?? .nothing
                            
                        }
                        
                        .onEnded{
                            
                            if self.dragState == .canReplace {
                                self.onEnded?($0.location, self.index!, self.character.character)
                            }
                            
                            withAnimation(.timingCurve(0.5, 0, 0.5, 1, duration: 0.3)){
                                isRotate = false
                            }
                            self.dragOffset = .zero
                            
                        }
                    
                )
                
                
                Text("\(character.character)")
                    .foregroundColor(.black)
                    .font(Font.system(size: 65 * scale)).fontWeight(.semibold)
                    .opacity(character.consumed[0] == 1 ? 1.0 : 0.0)
                    .background(.clear)
                    .animation(.easeOut(duration: 1.0), value: character.consumed[0])
                
                
            }else if mode == .about {
                
                HStack(spacing:5 * scale){
                    ForEach(0...1, id:\.self) {
                        i in
                        VStack(spacing: 0) {
                            ForEach(0...2, id:\.self) {
                                j in
                                
                                let index = i * 3 + (j)
                                
                                
                                Dot(isFill: character.dots[index] == 1, scale: scale,lineWidth: 1)
                                    .overlay (
                                        GeometryReader(content: {
                                            geometry in
                                            if isHaptic{
                                                Color.clear.onAppear(){
                                                    character.frames[index] = geometry.frame(in: .global)
                                                }.onChange(of: article.randomSeed, perform: {
                                                    value in
                                                    
                                                    if position >= article.article.count {
                                                        print("\(position) - \(article.characters.count)")
                                                        return
                                                    }
                                                    character.frames[index] = geometry.frame(in: .global)
                                                    
                                                })
                                            }
                                        })
                                    )
                            
                                    
                                    
                            }
                        }
                    }
                }
                .frame(width: 66,height: 87)
                .background(hexColor.navbgColor)
                .cornerRadius(17)
                .shadow(color: isRotate ? hexColor.fillColor.opacity(0.25) : .clear ,radius: 25, y: 2)
                .overlay(
                    RoundedRectangle(cornerRadius: 17)
                        .stroke(hexColor.borderColor, lineWidth: 1)
                    
                )
                .overlay(
                    
                        GeometryReader(content: {
                            geometry in
                            if !isHaptic {
                                Color.clear.onAppear(){
                                    character.frames[0] = geometry.frame(in: .global)
                                    print(character.frames[0])
                                }
                            }
                        })
                    
                )
                
                Text("\(character.character)")
                    .foregroundColor(.black)
                    .font(Font.system(size: 65 * scale)).fontWeight(.semibold)
                    .opacity(character.consumed[0] == 1 ? 1.0 : 0.0)
                    .background(.clear)
                    .animation(.easeOut(duration: 1.0), value: character.consumed[0])
            } else {
                
                if brailleDisplay.displayLevel > 1 {
                    Text("\(character.character)")
                        .foregroundColor(.gray)
                        .font(Font.system(size: 24 * scale))
                }
                
                HStack(spacing:5 * scale){
                    ForEach(0...1, id:\.self) {
                        i in
                        VStack(spacing: 0) {
                            ForEach(0...2, id:\.self) {
                                j in
                                
                                let index = i * 3 + (j)
                                
                                Dot(isFill: character.dots[index] == 1 , scale: scale )
                                    .overlay (
                                        GeometryReader(content: {
                                            geometry in
                                            Color.clear.onAppear(){
                                                character.frames[index] = geometry.frame(in: .global)
                                            }.onChange(of: article.randomSeed, perform: {
                                                value in
                                                
                                                if position >= article.article.count {
                                                    print("\(position) - \(article.characters.count)")
                                                    return
                                                }
                                                character.frames[index] = geometry.frame(in: .global)
                                                
                                            })
                                        })
                                    )
                            }
                        }
                    }
                }
                .padding()
                //.shadow(color: .white,radius: 10 * scale, y: 2)
                //.blur(radius: 0.4)
                //.background(hexColor.bgColor)
                .clipShape(
                    RoundedRectangle(cornerRadius: 10 * scale)
                )
                
            }
        }
    }
}


struct BrailleCharView_Previews: PreviewProvider {
    @StateObject static var brailleDisplay = BrailleDisplay()
    var intro = "Stay hungry, Stay Foolish. Steve Jobs"
    @State static var article = "Stay hungry, Stay Foolish. Steve Jobs".braille

    
    static var previews: some View {
        ZStack {
            Color.init("EFF1F4").ignoresSafeArea()
            
            HStack{
                Text("ddddd").background(.white)
                BrailleCharView(article: $article, position: 0, character:
                                    $article.characters[0], mode: .experience, scale: 1).environmentObject(brailleDisplay)
                
                BrailleCharView(article: $article, position: 1, character:
                                    $article.characters[1], mode: .display, scale: 1).environmentObject(brailleDisplay)
            }
        }
//        .background(.white)
    }
}
