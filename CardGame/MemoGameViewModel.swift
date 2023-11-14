//
//  MemoGameViewModel.swift
//  CardGame
//
//  Created by student on 07/11/2023.
//

import SwiftUI

class MemoGameViewModel: ObservableObject{
    
    
    private static var emojis = ["😀","😃","😆","😅","🤣","😊"]
    let emoijsM1=["😀","😃","😆","😅","🤣","😊"]
    let emoijsM2=["🩳","👕","🩴","🎩","🧤","👗","🥿","⛑"]
    let emoijsM3=["🦧","🦒","🐂","🐩","🐑","🦈","🕷"]
    
    var color: Color = .red
    
    private static func createMemoGameViewModel() -> MemoGameModel<String>{
            return MemoGameModel<String>(numberOfPairsOfCards: 6){
                index in
                if emojis.indices.contains(index){
                    return emojis[index]
                } else {
                    return "⁈"
                }
                
            }
        }
    @Published private var model=createMemoGameViewModel()
    
    var cards: Array<MemoGameModel<String>.Card> {
        return model.cards
    }
    func shuffle(){
        model.shuffle()
    }
    
    func choose(_ card: MemoGameModel<String>.Card){
        model.choose(card)
    }
    func changeApplicationTheme(color: Color){
        print(color)
        self.color=color
        model=MemoGameViewModel.createMemoGameViewModel()
//        switch text {
//            case "Motyw 1":
//                self.color = .blue
//            MemoGameViewModel.emojis=emoijsM1
//            case "Motyw 2":
//                self.color = .red
//            MemoGameViewModel.emojis=emoijsM2
//            case "Motyw 3":
//                self.color = .green
//            MemoGameViewModel.emojis=emoijsM3
//            default:
//                self.color = .blue
//        }
//        MemoGameViewModel.emojis=MemoGameViewModel.emojis.shuffled()
    }
   
    
}
