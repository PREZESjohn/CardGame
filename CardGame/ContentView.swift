//
//  ContentView.swift
//  CardGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var lastScoreChange: (Int,String) = (0,"")
    @State var cardid: String=""
    @ObservedObject var viewmodel : MemoGameViewModel
    var body: some View {
        VStack{
            Text("Memo").font(.largeTitle).foregroundColor(.black)
            ScrollView{
                cards
                          //  .animation(.default,value: viewmodel.cards)
            }
            HStack{
                Text("Wynik: "+String(viewmodel.getScore()))
                Spacer()
                Button("shuffluj"){
                    withAnimation(.easeOut(duration: 0.3)){
                        viewmodel.shuffle()
                    }
                }
            }
            Spacer()
            selections

        }
        .foregroundColor(viewmodel.themeColor)
        .padding()
//        CirclePart(endAngle: .degrees(240))
//            .fill(Color.blue)
//            .overlay(RoundedRectangle(cornerRadius: 16).stroke(Color.orange, lineWidth: 4))
//            .padding()
    }



    var cards : some View {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85),spacing: 0)], spacing: 0){
                ForEach(viewmodel.cards){card in
                    
                    ZStack{
                        CardView(card, viewmodel.themeColor)
                            .aspectRatio(2/3, contentMode: .fit)
                            .padding(5)
                            .onTapGesture {
                                let resultTemp=viewmodel.getScore()
                                viewmodel.choose(card)
//                                let cards = viewmodel.cards
//                                let chosenIndex = cards.firstIndex(where: {$0.id == card.id})
//                                let card=cards[chosenIndex!]
//                                if(card.isMatched==true){
//                                    result+=4
//                                                    print(card.isMatched)
//                                                }else{
//                                                    if(card.hasBeenSeen==true){
//                                                        result-=1
//                                                    }
//                                                }
                                lastScoreChange=(viewmodel.getScore()-resultTemp,card.id)
                                self.cardid=card.id
                                print(viewmodel.getScore())
                            }
                        if self.cardid==card.id{
                            FlyingNumber(number: scoreChange(card.id))
                        }
                    }
//                    .overlay{
//                        if flyingNumberVis{
//                            FlyingNumber(number: scoreChange(card.id))
//                        }
//                    }
                }
            }.foregroundColor(viewmodel.themeColor)
            
            
        }
        var selections: some View{
            HStack{
                
                SectionButton(viewModel: viewmodel, imageName: "face.smiling", content: "Motyw 1", ownColor: .blue)
                Spacer()
                
                SectionButton(viewModel: viewmodel, imageName: "paperplane.circle", content: "Motyw 2", ownColor: .red)
                Spacer()
                
                SectionButton(viewModel: viewmodel, imageName: "heart", content: "Motyw 3", ownColor: .green)
            }
            
        }
    func scoreChange(_ id: String)->Int{
        if(lastScoreChange.1 == id){
            return lastScoreChange.0
        }else{
            return 0
        }
    }

}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewmodel: MemoGameViewModel())
    }
}
