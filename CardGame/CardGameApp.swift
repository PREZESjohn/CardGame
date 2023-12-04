//
//  CardGameApp.swift
//  CardGame
//
//  Created by student on 21/10/2023.
//

import SwiftUI

@main
struct CardGameApp: App {
    @StateObject var game=MemoGameViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(viewmodel: game)
        }
    }
}
