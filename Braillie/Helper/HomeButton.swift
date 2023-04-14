//
//  BackButton.swift
//  Braillie
//
//  Created by Kai Shing Ng on 30/3/2023.
//

import SwiftUI

struct HomeButton: View {
    @Binding var setting: Setting
    var action : (()->(Void))
    
    var body: some View {
        
        HStack(){
            Button(action: {
                if !setting.isHomePageShow{
                    action()
                }
                
            }) {
                Label("", systemImage: "house")
                    .font(.system(size: 20))
                    .foregroundColor(ColorHex().hintColor)
            }
            Spacer()
        }
        
    }
}


