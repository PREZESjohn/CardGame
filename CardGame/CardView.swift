//
//  CardView.swift
//  CardGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct CardView: View {
//    let content: String
//    @State var isFaceUp : Bool = false
    
    var card: MemoGameModel<String>.Card
    var color: Color
    
    init(_ card:MemoGameModel<String>.Card, _ color: Color) {
        self.card=card
        self.color=color
    }
    
    var body: some View {
//        ZStack{
//            let base = RoundedRectangle(cornerRadius: 12)
//            Group{
//                base.fill(Color.white)
//                base.strokeBorder(lineWidth: 3)
//                Text(card.content)
//                    .font(.system(size: 200))
//                    .minimumScaleFactor(0.01)
//                    .aspectRatio(1,contentMode: .fit)
//            }
//            .opacity(card.isFaceUp ? 1 : 0)
//            base.fill().opacity(card.isFaceUp ? 0 : 1)
//        }
//        .foregroundColor(color)
//        .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        CirclePart(endAngle: .degrees(120))
            .fill(color)
            .overlay(RoundedRectangle(cornerRadius: 12).stroke(color, lineWidth: 3))
            .TransformIntoCard(with: card.content, isFaceUp: card.isFaceUp, isMatched: card.isMatched)
            .rotation3DEffect(.degrees(card.isFaceUp ? 180 : 0), axis:(0,1,0))
            .animation(.linear(duration: 0.5),value: card.isFaceUp)
            .foregroundColor(color)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
        
    }
}

//struct CardView_Previews: PreviewProvider {
//    static var previews: some View {
//        CardView(content: "String")
//    }
//}
