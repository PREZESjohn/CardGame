//
//  FlyingNumber.swift
//  CardGame
//
//  Created by student on 30/11/2023.
//

import SwiftUI

struct FlyingNumber: View {
    let number: Int
    @State var offset: CGFloat = 0
    
    var body: some View {
        formattedNumber(number)
            .font(.system(size: 50))
            .foregroundColor(number<0 ? Color.red : Color.blue)
            .shadow(color: Color.black, radius: 1.5, x: 5, y: 5)
            .offset(y: offset)
            .onAppear{
                offset = number < 0 ? 100 : -100
            }
            .opacity(offset != 0.0 ? 0 : 1)
            .animation(.linear(duration: 1.5))
            .onDisappear{
                offset=0
            }
    }
}
func formattedNumber(_ number: Int)->Text{
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    if(number>=0){
        formatter.positivePrefix = "+"
    }else{
        formatter.positivePrefix = "-"
    }
    guard let formatted=formatter.string(for: abs(number)) else{
        return Text("?")
    }
    return Text(formatted)
}

struct FlyingNumber_Previews: PreviewProvider {
    static var previews: some View {
        FlyingNumber(number: 5)
    }
}
