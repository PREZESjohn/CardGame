//
//  ContentView.swift
//  CardGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    let emoijsM1=["😀","😃","😆","😅","🤣","😊"]
    let emoijsM2=["🩳","👕","🩴","🎩","🧤","👗","🥿","⛑"]
    let emoijsM3=["🦧","🦒","🐂","🐩","🐑","🦈","🕷"]
    
    @State var emoijs=["😀","😃","😆","😅","🤣","😊","😀","😃","😆","😅","🤣","😊"].shuffled()
    @State var color: Color = .blue
    //@State var cardCount = 12
    
    @ObservedObject var viewmodel: MemoGameViewModel
    
    var body: some View {
        VStack{
            Text("Memo").font(.largeTitle).foregroundColor(.black)
            ScrollView{
                cards
            }
            selections
            
            
            //lab3
//            ScrollView{
//                cards
//            }
//            cardsCountAdjuster
        }
        .foregroundColor(color)
        .padding()
    }
    
//    func adjustCardNumber(by offset: Int, symbol: String) -> some View{
//        Button(action:{cardCount += offset}) {
//
//            Text(symbol)
//                .padding(.horizontal)
//                .font(.largeTitle)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 12).stroke(Color.blue, lineWidth: 2))
//
//        }
//
//
//        //.disabled(cardCount<=2 || cardCount>emoijs.count)
//    }
//
//    var cardsCountAdjuster: some View {
//        HStack {
//            cardRemover
//            Spacer()
//            cardAdder
//
//        }
//    }
//
//    var cardAdder: some View {
//            adjustCardNumber(by: 2, symbol: "+").disabled( cardCount+2>emoijs.count)
//        }
//        var cardRemover: some View{
//            adjustCardNumber(by: -2, symbol: "-").disabled(cardCount<=2)
//        }

    var cards : some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 70))], spacing: 16){
            ForEach(0..<emoijs.count, id: \.self){
                index in
                CardView(content: emoijs[index])
                .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(color)
        
        
    }
    var selections: some View{
        HStack{
            SectionButton(color: $color, symbol: "face.smiling", text: "Motyw 1")
                .onTapGesture(perform:{
                    changeMotyw(text: "Motyw 1")
                })
            Spacer()
            SectionButton(color: $color, symbol: "paperplane.circle", text: "Motyw 2")
                .onTapGesture(perform:{
                    changeMotyw(text: "Motyw 2")
                })
            Spacer()
            SectionButton(color: $color, symbol: "heart", text: "Motyw 3")
            .onTapGesture(perform:{
                    changeMotyw(text: "Motyw 3")
                })
        }
        
    }
    func changeMotyw(text: String){
        switch text {
            case "Motyw 1":
                self.color = .blue
                emoijs=emoijsM1
            case "Motyw 2":
                self.color = .red
                emoijs=emoijsM2
            case "Motyw 3":
                self.color = .green
                emoijs=emoijsM3
            default:
                self.color = .blue
        }
        emoijs+=emoijs
        emoijs=emoijs.shuffled()

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
