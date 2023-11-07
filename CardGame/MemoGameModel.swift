//
//  MemoGameModel.swift
//  CardGame
//
//  Created by student on 07/11/2023.
//

import Foundation

struct MemoGameModel<CardContent>{
    private var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent){
        cards=[]
        for pairIndex in 0..<max(2,numberOfPairsOfCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id:"\(pairIndex+1)a"))
            cards.append(Card(content: content, id:"\(pairIndex+1)b"))

        }
    }
    func choose(_ card: Card){}
    
    struct Card{
            var isFaceUp: Bool = false
            var isMatched: Bool = false
            var content: CardContent
            var id: String
        }
}
