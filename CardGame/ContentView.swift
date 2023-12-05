//
//  ContentView.swift
//  CardGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @State var cardid: String=""
    @ObservedObject var viewmodel : MemoGameViewModel
    var body: some View {
        VStack{
            Text("Memo").font(.largeTitle).foregroundColor(.black)
            ScrollView{
                cards
                          .animation(.default,value: viewmodel.cards)
            }
            HStack{
                Text("Wynik: "+String(viewmodel.getScore()))
                Spacer()
                Button("shuffluj"){

                        viewmodel.shuffle()

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
                        CardView(card, viewmodel.themeColor)
                            .aspectRatio(2/3, contentMode: .fit)
                            .padding(5)
                            .onTapGesture {
                                viewmodel.choose(card)

                    

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
