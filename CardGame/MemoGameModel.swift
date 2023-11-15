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
            if !cards[chosenIndex].isFaceUp && !cards[chosenIndex].isMatched{
                if let potentialMachedIndex = indexOfOneAndOnlyFaceUpCard{
                    if cards[chosenIndex].content == cards[potentialMachedIndex].content{
                        cards[chosenIndex].isMatched=true
                        cards[potentialMachedIndex].isMatched=true
                    }
                }else{
                    indexOfOneAndOnlyFaceUpCard=chosenIndex
                }
                cards[chosenIndex].isFaceUp=true
            }
        }
        
    }
	var indexOfOneAndOnlyFaceUpCard: Int?{
        get{
            cards.indices.filter{index in cards[index].isFaceUp}.only
        }
        set{
            cards.indices.forEach{cards[$0].isFaceUp=(newValue==$0)}
        }
    }
    private func index(of card:Card)->Int?{
        for index in cards.indices{
            if cards[index].id == card.id{
                return index
            }
        }
        return nil
    }
    
    mutating func shuffle(){
        cards.shuffle()
    }
    
 struct Card: Equatable,Identifiable, CustomDebugStringConvertible{
            var isFaceUp: Bool = false
            var isMatched: Bool = false
            var content: CardContent
            var id: String
        var debugDescription: String{
            return "\(id): \(content) \(isFaceUp ? "up" : "down") \(isMatched ? "mached" : "") "
        }
    }
}
extension Array{
    var only: Element?{
        count == 1 ? first : nil
    }
}