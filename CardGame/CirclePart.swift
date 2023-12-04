//
//  CirclePart.swift
//  CardGame
//
//  Created by student on 29/11/2023.
//

import SwiftUI
import CoreGraphics

struct CirclePart: Shape {
    var startAngle: Angle = .zero
    let endAngle: Angle
    
    func path(in rect: CGRect) ->Path{
        
        let startAngel = startAngle - .degrees(90)
        let endAngle = endAngle - .degrees(90)
        
        let center=CGPoint(x: rect.midX, y: rect.midY)
        let radius = min(rect.width,rect.height)/2
        let start=CGPoint(x: center.x + radius*cos(CGFloat(startAngel.radians)), y: center.y + radius*sin(CGFloat(startAngle.radians)))
        var p=Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(center: center, radius: radius, startAngle: startAngel, endAngle: endAngle, clockwise: true)
        p.addLine(to: center)
        return p
    }
}


