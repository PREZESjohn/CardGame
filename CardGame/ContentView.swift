//
//  ContentView.swift
//  CardGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    @State var lastScoreChange: (Int,String) = (0,"")
    @ObservedObject var viewmodel : MemoGameViewModel
    var body: some View {
        VStack{
            Text("Memo").font(.largeTitle).foregroundColor(.black)
            ScrollView{
                cards
                    //.animation(.default,value: viewmodel.cards)
            }
            HStack{
                Text("Wynik: "+String(viewmodel.getScore())).font(.title).foregroundColor(.black)
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
                            lastScoreChange=(viewmodel.getScore()-resultTemp,card.id)
                            //self.cardid=card.id
                        }
                    if lastScoreChange.1==card.id {
                        FlyingNumber(number: scoreChange(card.id))
                    }
                }
            }
        }
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

