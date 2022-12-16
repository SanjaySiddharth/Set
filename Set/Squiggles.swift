//
//  Squiggles.swift
//  Set
//
//  Created by Sanjay Siddharth on 14/12/22.
//

import SwiftUI

struct Squiggles: Shape {
    let firstArc = Angle(degrees:0)
    let secondArc = Angle(degrees:360 )

    func path(in rect: CGRect) -> Path {
        var p = Path()
        let center = CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width, rect.height)/2
        let firstPoint = CGPoint(x: center.x + radius*CGFloat(cos(firstArc.radians)), y: center.y + radius*CGFloat(sin(firstArc.radians)))

        p.move(to: firstPoint)
        p.addArc(center: center, radius: radius, startAngle: firstArc, endAngle: secondArc, clockwise: true)

        return p
    }
}

struct Squiggles_Previews: PreviewProvider {
    static var previews: some View {
        Squiggles()
    }
}
