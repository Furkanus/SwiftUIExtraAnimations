//
//  CapsuleFluid.swift
//  SwiftUIExtraAnimations
//
//  Created by Furkan Hanci on 9/16/20.
//

import SwiftUI

struct CapsuleFluid: Shape {
    var time: CGFloat
    var curveHeight: CGFloat
    func path(in rect: CGRect) -> Path {
        return (
            Path { path in
                path.move(to: CGPoint(x: 100, y: 800))
                path.addLine(to: CGPoint(x: 0, y: 800))
                for i in stride(from: 0, to: CGFloat(rect.width), by: 1) {
                    path.addLine(to: CGPoint(x: i, y: sin(((i / rect.height) + time) * 4 * .pi) * curveHeight + rect.midY))
                }
                path.addLine(to: CGPoint(x: 100, y: 800))
            }
        )
    }
}
