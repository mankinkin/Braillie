//
//  BrailleGridView.swift
//  Braillie
//
//  Created by Yu Ho Kwok on 24/3/2023.
//

import SwiftUI


struct BrailleGridView: View {
    
    
    @State var article : BraillArticle
    
    var mode = BrailleView.Mode.experience
    var scale = 1.0
    var bottom_padding = 20
    var needEmptyDot = true
    var gridItemLayout : [GridItem]
    
    var body: some View {
        
        LazyVGrid(columns: gridItemLayout) {
            
            ForEach(0..<article.characters.count, id:\.self) {
                i in
                if needEmptyDot || article.characters[i].character != " " {
                    BrailleCharView(article: $article, position: i, character:
                                        $article.characters[i], mode: mode, scale: self.scale).padding([.bottom], CGFloat(bottom_padding))
                }else{
                    Text("")
                        .padding([.bottom, .horizontal], CGFloat(bottom_padding))
                }
            }
        }
        .gesture(
            DragGesture(minimumDistance: 1, coordinateSpace: .global)
                .onChanged {
                    value in
                  
                        article.touch(value.location, for: mode)
                    
                }
            
            
                .onEnded{
                    value in
                    
                        article.reset()
                    
                }
        )
        .padding()
        
    }
}

//struct BrailleView_Previews: PreviewProvider {
//    static var previews: some View {
//        BrailleView()
//    }
//}
