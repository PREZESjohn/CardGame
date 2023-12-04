//
//  MemoGameViewModel.swift
//  CardGame
//
//  Created by student on 07/11/2023.
//
import Foundation
import SwiftUI

class MemoGameViewModel: ObservableObject{
    
    
//    private static var emojis = ["😀","😃","😆","😅","🤣","😊"]
//    let emoijsM1=["😀","😃","😆","😅","🤣","😊"]
//    let emoijsM2=["🩳","👕","🩴","🎩","🧤","👗","🥿","⛑"]
//    let emoijsM3=["🦧","🦒","🐂","🐩","🐑","🦈","🕷"]
    private static let emojis: [Color: [String]]=[
    Color.blue:["😀","😃","😆","😅","🤣","😊"],
    Color.red:["🩳","👕","🩴","🎩","🧤","👗","🥿","⛑"],
    Color.green:["🦧","🦒","🐂","🐩","🐑","🦈","🕷"]
    ]
    
    
   
    
    private static func createMemoGameModel(color: Color = .blue) -> MemoGameModel<String>{
            return MemoGameModel<String>(numberOfPairsOfCards: 6){
                index in
//                if emojis.indices.contains(index){
//                    return emojis[index]
//                } else {
//                    return "⁈"
//                }
                if let themeEmojis = emojis[color], themeEmojis.indices.contains(index){
                    return themeEmojis[index]
                }else{
                    return "⁈"
                }
                
            }
        }
    @Published private var model=createMemoGameModel()
    var themeColor: Color=Color.blue
    
    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }
    
    // MARK: - Zamiary
    
    func shuffle(){
        model.shuffle()
    }
    func getScore()->Int{
        return model.getScore()
    }
    
    func choose(_ card: MemoGameModel<String>.Card){
        model.choose(card)
    }
    func changeApplicationTheme(color: Color){
        print("color przekazany do viewmodel")
        print(color)
        self.themeColor=color
        print("color viewmodel")
        print(self.themeColor)
        model=MemoGameViewModel.createMemoGameModel(color: color)
        shuffle()
        
//        switch color {
//            case .blue:
//                MemoGameViewModel.emojis=emoijsM1
//            case .red:
//                MemoGameViewModel.emojis=emoijsM2
//            case .green:
//                MemoGameViewModel.emojis=emoijsM3
//            default:
//                MemoGameViewModel.emojis=emoijsM1
//        }
        
        
    }
   
    
}

