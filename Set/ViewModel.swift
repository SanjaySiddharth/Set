//
//  ViewModel.swift
//  Set
//
//  Created by Sanjay Siddharth on 14/12/22.
//

import Foundation
import SwiftUI

class ViewModel:ObservableObject{
    typealias SetModelType = SetModel<AnyView,Color,String>
    typealias Card = SetModel<AnyView,Color,String>.Card
    static let cardShapes : Array<AnyView> = [AnyView(Diamond()),AnyView(Oval()),AnyView(Squiggles())]
    static let cardColors : Array<Color> = [Color.white,Color.black,Color.red]
    static let cardPatterns : Array<String> = ["Solid","Striped","Outlined"]
    static let cardMultiples : [Int] = [1,2,3]
    //static let cardMultiples : Array<Range<Int>> = [1..<2,1..<3,1..<4]
    
    //cardContents is -> setting a default property value with a closure / function
     private(set) static var cardContents : [Card.CardContent] = {
        var contents : [Card.CardContent] = []
        for shape in cardShapes{
            for color in cardColors{
                for pattern in cardPatterns{
                    for multiple in cardMultiples{
                        contents.append(Card.CardContent(shape: shape, color: color, pattern: pattern,multiple: multiple))
                    }
                }
            }
        }
        return contents.shuffled()
    }()
    
    private static func createSetGame() -> SetModel<AnyView,Color,String>{
        SetModel(numberOfCards: 12, createContent: {
            index in cardContents[index]
        })
        
    }
    @Published var model : SetModelType = ViewModel.createSetGame()
    
    
    //var cards i using READ ONLY Computed property
    var cards : [Card] {
        return model.cards
    }
    
    

        
    
}
       
    
