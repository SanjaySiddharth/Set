//
//  Model.swift
//  Set
//
//  Created by Sanjay Siddharth on 12/12/22.
//

import Foundation


struct SetModel<SymbolShape,SymbolColor,SymbolPattern> {
    private(set) var cards : Array<Card>
    
    
    init(numberOfCards : Int, createContent : (Int) -> Card.CardContent) {
        cards = []
        for index in 0..<numberOfCards{
            let content = createContent(index)
            cards.append(Card(id: index, content: content))
        }
    }
    
    
    
    struct Card : Identifiable {
        var id:Int
        var isMatched:Bool = false
        var isChosen:Bool=false
        var content : CardContent
        struct CardContent{
            let shape : SymbolShape
            let color : SymbolColor
            let pattern : SymbolPattern
            let multiple : Int
            
        }
        
        
    }
}
