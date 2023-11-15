//
//  SectionButton.swift
//  CardGame
//
//  Created by student on 17/10/2023.
//

import SwiftUI

struct SectionButton: View {
    @ObservedObject var viewModel: MemoGameViewModel
    var imageName : String
    var content : String
    var ownColor : Color
    
    var body: some View {
        Button(action: {
            viewModel.changeApplicationTheme(color: ownColor)
        }, label: {
            VStack{
                Image(systemName: imageName).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                Text(content)
            }.foregroundColor(viewModel.themeColor)
        })
    }
}
