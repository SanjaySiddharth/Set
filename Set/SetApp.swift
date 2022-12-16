//
//  SetApp.swift
//  Set
//
//  Created by Sanjay Siddharth on 12/12/22.
//

import SwiftUI

@main
struct SetApp: App {
    let game = ViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView(game: game)
        }
    }
}
