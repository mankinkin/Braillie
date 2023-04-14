//
//  CheckButton.swift
//  Braillie
//
//  Created by Kai Shing Ng on 6/4/2023.
//

import SwiftUI

struct CheckButton: View {
    
    
    @Binding var inputText: BraillArticle
    @Binding var text: String
    @Binding var isCorrect: Bool
    
    @State var checkStatus = 0

    @State var angle = 0.0
    var setting = Setting()
    
    
    var body: some View {
      
        Button(action: {
            
            if checkStatus == 2{
                
                checkStatus = 0
                text = setting.textArr.randomElement()!
                inputText = BraillArticle(string: " ")
                
            }else if inputText.characters[0].dots == text.braille.characters[0].dots {
                checkStatus = 2
                isCorrect.toggle()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                    isCorrect.toggle()
                    
                    
                }
            }else{
                
                checkStatus = 1
                withAnimation(.timingCurve(0.5, 0, 0.5, 1, duration: 0.15)) {
                    angle = 20
                }
                
                withAnimation(.timingCurve(0.5, 0, 0.5, 1, duration: 0.3).delay(0.15)){
                    angle = -20
                }
                
                withAnimation(.timingCurve(0.5, 0, 0.5, 1, duration: 0.3).delay(0.45)){
                    angle = 20
                }
                
                withAnimation(.timingCurve(0.5, 0, 0.5, 1, duration: 0.15).delay(0.75)){
                    angle = 0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                    checkStatus = 0
                    inputText = BraillArticle(string: " ")
                    //isCorrect.toggle()
                }
                
                
            }
        }, label: {
            
            Image(systemName: setting.imgCheck[checkStatus])
                .offset(x: angle, y: 0)
                .frame(width: 52,height: 52)
                .foregroundColor(setting.colorCheck[checkStatus])
                .font(.system(size: 52))
            
                .rotationEffect(Angle(degrees: angle), anchor: .center)
            //.animation(.easeInOut(duration: 0.5))
            
            
            
        })
    }
}

