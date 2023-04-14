//
//  CheckButton.swift
//  Braillie
//
//  Created by Kai Shing Ng on 6/4/2023.
//

import SwiftUI

struct CheckButton2: View {
    
    
    @Binding var isCorrect: Bool
    @Binding var question: BraillArticle
    @Binding var firstRow: BraillArticle
    @Binding var secondRow: BraillArticle
    @Binding var answer: [String]
    @Binding var btnFrame: [CGRect]
    
    @State var checkStatus = 0

    @State var angle = 0.0
    var setting = Setting()
    
    
    var body: some View {
      
        Button(action: {
            
            let answerStr = answer.compactMap { $0 as? String }.joined(separator: "")
            
           
            
            if checkStatus == 2{
                
                checkStatus = 0
                var randomString = setting.engStr.shuffled()
                question = BraillArticle(string: setting.words.randomElement()!)
                firstRow = BraillArticle(string: String(randomString.prefix(13)))
                secondRow = BraillArticle(string: String(randomString.suffix(13)))
                answer = [String](repeating: "", count: question.characters.count)
                btnFrame = [CGRect](repeating: .zero, count: question.characters.count)
                
            }else if answerStr.uppercased() == question.article.uppercased() {
                
                checkStatus = 2
                isCorrect.toggle()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.1) {
                    isCorrect.toggle()
                    
                    
                }
            }else{
                print(answerStr.uppercased())
                print(question.article.uppercased())
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
                    answer = [String](repeating: "", count: question.characters.count)
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
                .padding(20)
            //.animation(.easeInOut(duration: 0.5))
            
            
            
        })
    }
}

