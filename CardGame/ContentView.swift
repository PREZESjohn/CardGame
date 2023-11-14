//
//  ContentView.swift
//  CardGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    
//    let emoijsM1=["😀","😃","😆","😅","🤣","😊"]
//    let emoijsM2=["🩳","👕","🩴","🎩","🧤","👗","🥿","⛑"]
//    let emoijsM3=["🦧","🦒","🐂","🐩","🐑","🦈","🕷"]
    
    //@State var emoijs=["😀","😃","😆","😅","🤣","😊","😀","😃","😆","😅","🤣","😊"].shuffled()
    //var color: Color = .blue
    //@State var cardCount = 12
    
    @ObservedObject var viewmodel: MemoGameViewModel
    
    var body: some View {
        VStack{
            Text("Memo").font(.largeTitle).foregroundColor(.black)
            ScrollView{
                cards
                    .animation(.default,value: viewmodel.cards)
            }
            Button("shuffluj"){
                viewmodel.shuffle()
            }
            selections
            
            
            //lab3
//            ScrollView{
//                cards
//            }
//            cardsCountAdjuster
        }
        .foregroundColor(viewmodel.color)
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
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85),spacing: 0)], spacing: 0){
            ForEach(viewmodel.cards){card in
                CardView(card)
                .aspectRatio(2/3, contentMode: .fit)
                .padding(5)
                .onTapGesture {
                    viewmodel.choose(card)
                }
            }
        }
        .foregroundColor(viewmodel.color)
        
        
    }
    var selections: some View{
        HStack{
            
            SectionButton(viewModel: MemoGameViewModel(), imageName: "face.smiling", content: "Motyw 1", ownColor: .blue)
            Spacer()
            
            SectionButton(viewModel: MemoGameViewModel(), imageName: "paperplane.circle", content: "Motyw 2", ownColor: .red)
            Spacer()
            
            SectionButton(viewModel: MemoGameViewModel(), imageName: "heart", content: "Motyw 3", ownColor: .green)
        }
        
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
    ContentView(viewmodel: MemoGameViewModel())
}
