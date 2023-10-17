//
//  ContentView.swift
//  CardGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    let emoijs = ["😀","😃","😆","😅","🤣","😊","🙂"]
    @State var cardCount = 4
    
    
    var body: some View {
        VStack{
            ScrollView{
                cards
            }
            cardsCountAdjuster
        }
        
        .padding()
    }
    
    func adjustCardNumber(by offset: Int, symbol: String) -> some View{
        Button(action:{cardCount += offset}) {
    
            Text(symbol)
                .padding(.horizontal)
                .font(.largeTitle)
                .overlay(
                    RoundedRectangle(cornerRadius: 12).stroke(Color.blue, lineWidth: 2))
            
        }
        

        //.disabled(cardCount<=2 || cardCount>emoijs.count)
    }
    
    var cardsCountAdjuster: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder

        }
    }
    
    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]){
            ForEach(0..<cardCount, id: \.self){
                index in
                CardView(content: emoijs[index])
                //.aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.blue)
    }
    var cardAdder: some View {
        adjustCardNumber(by: 2, symbol: "+").disabled( cardCount+2>emoijs.count)
    }
    var cardRemover: some View{
        adjustCardNumber(by: -2, symbol: "-").disabled(cardCount<=2)
    }
//    struct CardView: View {
//        let content: String
//        @State var isFaceUp : Bool = true
//        var body: some View {
//            ZStack{
//                let base = RoundedRectangle(cornerRadius: 12)
//                if isFaceUp {
//                    base.fill(Color.white)
//                    base.strokeBorder(lineWidth: 3)
//                    Text(content).font(.largeTitle)
//                } else {
//                    base.fill()
//                }
//            }
//            .foregroundColor(.orange)
//            .onTapGesture(perform: {isFaceUp.toggle()})
//        }
//    }
    
}

#Preview {
    ContentView()
}
