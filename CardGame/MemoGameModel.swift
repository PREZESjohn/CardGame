//
//  MemoGameModel.swift
//  CardGame
//
//  Created by student on 07/11/2023.
//

import Foundation

struct MemoGameModel<CardContent> where CardContent : Equatable{
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int)->CardContent){
        cards=[]
        for pairIndex in 0..<max(2,numberOfPairsOfCards){
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content, id:"\(pairIndex+1)a"))
            cards.append(Card(content: content, id:"\(pairIndex+1)b"))

        }
    }
    mutating func choose(_ card: Card){
        if let chosenIndex = cards.firstIndex(where: {$0.id == card.id}){
            if cards[chosenIndex].isFaceUp==true {
                cards[chosenIndex].isFaceUp=false
            }else{
                cards[chosenIndex].isFaceUp=true
            }
        }
        
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
    struct Card: Equatable,Identifiable{
            var isFaceUp: Bool = false
            var isMatched: Bool = false
            var content: CardContent
            var id: String
        }
}
