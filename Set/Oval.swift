//
//  Oval.swift
//  Set
//
//  Created by Sanjay Siddharth on 13/12/22.
//

import SwiftUI

struct Oval: Shape {
    
    let firstArc = Angle(degrees:-60)
    let secondArc = Angle(degrees: -120)
    let thirdArc = Angle(degrees: -240)
    let fourthArc = Angle(degrees: -300)
        
    func path(in rect: CGRect) -> Path {
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height)/2
        let firstPoint = CGPoint(x: center.x + radius*CGFloat(cos(firstArc.radians)), y: center.y + radius*CGFloat(sin(firstArc.radians)))
        let secondPoint = CGPoint(x: center.x + radius*CGFloat(cos(secondArc.radians)), y: center.y + radius*CGFloat(sin(secondArc.radians)))
        let thirdPoint = CGPoint(x: center.x + radius*CGFloat(cos(thirdArc.radians)), y: center.y + radius*CGFloat(sin(thirdArc.radians)))
        let fourthPoint = CGPoint(x: center.x + radius*CGFloat(cos(fourthArc.radians)), y: center.y + radius*CGFloat(sin(fourthArc.radians)))

        var p = Path()
        p.move(to: firstPoint)
//        p.addArc(center: center, radius: radius, startAngle: firstArc, endAngle: secondArc, clockwise: true)
//        p.addLine(to: secondLine)
//        p.addArc(center: center, radius: radius, startAngle: thirdArc, endAngle: fourthArc, clockwise: true)
        p.addQuadCurve(to: secondPoint, control: CGPoint(x: rect.midX, y: rect.minY*1.012))
        p.addLine(to: thirdPoint)
        p.addQuadCurve(to: fourthPoint, control: CGPoint(x: rect.midX, y: rect.maxY*1.012))
        
        
        
        return p
    }
        
    
    
}

struct Oval_Previews: PreviewProvider {
    static var previews: some View {
        Oval()
    }
}
