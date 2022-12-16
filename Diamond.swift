//
//  Diamond.swift
//  Set
//
//  Created by Sanjay Siddharth on 12/12/22.
//

import SwiftUI

struct Diamond: Shape {
    let firstAngle = Angle(radians: 0-90)
    let secondAngle = Angle(radians: 90-90)
    let thirdAngle = Angle(radians: 180-90)
    let fourthAngle = Angle(radians: 270-90)
    
    
    
    func path(in rect: CGRect) -> Path {

        var path = Path()
        // get the center of the rect
        let center = CGPoint(x: rect.midX, y: rect.midY)
        // get the starting of our drawing the right side of our diamond
        let startingPoint = CGPoint(x: center.x, y: rect.maxY)
        // move our start of drawing to the beggining point
        path.move(to: startingPoint)
        // distance / 2 is our height
        // create all our points
        let secondPoint = CGPoint(x: rect.minX, y: center.y)
        let thirdPoint = CGPoint(x: center.x, y: rect.minY)
        let fourthPoint = CGPoint(x:rect.maxX,y: center.y)
        path.addLine(to: secondPoint)
        path.addLine(to: thirdPoint)
        path.addLine(to: fourthPoint)
        path.addLine(to: startingPoint)
        return path

    }
}


struct Diamond_Previews: PreviewProvider {
    static var previews: some View {
        Diamond()
    }
}
