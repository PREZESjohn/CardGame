//
//  CardView.swift
//  CardGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct CardView: View {
    let content: String
    @State var isFaceUp : Bool = false
    var body: some View {
        ZStack{
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.fill(Color.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base.fill()
            }
        }
        //.foregroundColor(.orange)
        .onTapGesture(perform: {isFaceUp.toggle()})
    }
}

#Preview {
    CardView(content: "String")
}
