//
//  TransformIntoCard.swift
//  CardGame
//
//  Created by student on 29/11/2023.
//

import SwiftUI

struct TransformIntoCard: ViewModifier{
    var cardContent: String
    var isFaceUp: Bool
    var isMatched: Bool
    func body(content: Content) -> some View {
        ZStack{
                Group{
                    content
                    Text(cardContent)
                        .font(.system(size: 200))
                        .minimumScaleFactor(0.01)
                        .aspectRatio(1,contentMode: .fit)
                        .opacity(isFaceUp ? 1 : 0)
                    
                }
                RoundedRectangle(cornerRadius: 12).opacity(isFaceUp ? 0 : 1)

        }
    }
    
    
}
extension View{
    func TransformIntoCard(with cardContent: String, isFaceUp: Bool, isMatched: Bool) -> some View{
        modifier(CardGame.TransformIntoCard(cardContent: cardContent, isFaceUp: isFaceUp, isMatched: isMatched))
    }
}

