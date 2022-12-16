//
//  ContentView.swift
//  Set
//
//  Created by Sanjay Siddharth on 12/12/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var game : ViewModel
    var body: some View {
        ScrollView{
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 100))]){
                ForEach(game.cards){ card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: .fit)
                }
            }
            .padding(.horizontal)
            .foregroundColor(.black)
        }
    }
}

struct CardView:View{
    let card : ViewModel.Card
    
    var body : some View{
        let shape = card.content.shape
        let color = card.content.color
        let pattern = card.content.pattern
        let multiple = card.content.multiple
        
        ZStack{
            RoundedRectangle(cornerRadius: 10).fill().foregroundColor(.green)
            VStack{
                ForEach(0..<multiple,id: \.self){_ in
                    shape.foregroundColor(color)
                }
            }
            .padding()
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = ViewModel()
        ContentView(game: game)
    }
}
