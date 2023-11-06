//
//  SectionButton.swift
//  CardGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct SectionButton: View {
    @Binding var color: Color
    @State var symbol: String
    @State var text: String
    var body: some View {
        //Button(action:{}){
            VStack{
                Image(systemName: symbol)
                Text(text).font(.footnote)
            }
                
       // }
    }
}

#Preview {
    SectionButton(color: .constant(.blue), symbol: "face.smiling", text: "MOTYW 1")
}
