//
//  ThirdAnimation.swift
//  SwiftUIExtraAnimations
//
//  Created by Furkan Hanci on 9/16/20.
//

import SwiftUI

struct ThirdAnimation: View {
    
    @State private var time: Double = 0
      @State private var animate = false
      @State private var offsetY: CGFloat = 0
    
    var body: some View {
       
        ZStack {
                   Capsule()
                       .frame(width: capsuleHeight / 3, height: capsuleHeight)
                       .foregroundColor(.white)
                       .shadow(radius: shadowRadius)
                   
                   ZStack {
                       CapsuleFluid(time: CGFloat(time*1.2), curveHeight: waveHeight)
                           .fill(backgroundFluidColor)
                           .frame(width: capsuleHeight / 3, height: capsuleHeight)
                       CapsuleFluid(time: CGFloat(time), curveHeight: waveHeight)
                           .fill(foregroundFluidColor)
                           .opacity(0.5)
                           .frame(width: capsuleHeight / 3, height: capsuleHeight)
                   }
                   .offset(x: 0, y: self.offsetY)
                   .mask(Capsule())
               }
               .onAppear() {
                   self.offsetY = (self.capsuleHeight / 2) + self.waveHeight
                   self.animate.toggle()
                   Timer.scheduledTimer(withTimeInterval: 0.03, repeats: true) { _ in
                       self.time += 0.01
                       if self.offsetY >= ((-self.capsuleHeight / 2) - self.waveHeight) {
                           if self.animate {
                               withAnimation(Animation.linear(duration: 0.03)) {
                                   self.offsetY -= self.fluidSpeed
                               }
                           }
                       }
                   }
               }
    }
    
    let capsuleHeight: CGFloat = 300
        let shadowRadius: CGFloat = 5
        let fluidSpeed: CGFloat = 1
        let waveHeight: CGFloat = 20
        let foregroundFluidColor = LinearGradient(gradient: Gradient(colors: [Color(.blue), Color(red: 0.35, green: 0.80, blue: 0.93)]), startPoint: .top, endPoint: .bottom)
        let backgroundFluidColor = Color(red: 0.35, green: 0.80, blue: 0.93)
}

struct ThirdAnimation_Previews: PreviewProvider {
    static var previews: some View {
        ThirdAnimation()
    }
}
