//
//  SpinAnimation.swift
//  Animations (iOS)
//
//  Created by iresh sharma on 20/06/21.
//

import SwiftUI

struct SpinAnim: View {
    
    @State private var animationAmount: Double = 0
    @State private var axisX: CGFloat = 1
    @State private var axisY: CGFloat = 0
    @State private var axisZ: CGFloat = 0
    @State private var changeAngle: Double = 60
    
    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    self.animationAmount += changeAngle
                }
            }) {
                Image(systemName: "dollarsign.circle")
                    .renderingMode(.none)
                    .resizable(resizingMode: .stretch)
                    .frame(width: 100.0, height: 100.0)
            }
            .padding(40)
            .foregroundColor(.white)
            .background(
                RadialGradient(gradient: Gradient(colors: [Color.yellow, Color.black.opacity(0.5)]), center: .center, startRadius: 80, endRadius: 100))
            .clipShape(Circle())
            .rotation3DEffect(
                .degrees(animationAmount),
                axis: (x: axisX, y: axisY, z: axisZ)
            )
            HStack {
                VStack {
                    Text("X: \(axisX, specifier: "%g")")
                    Stepper("X Axis", value: $axisX).labelsHidden()
                }
                VStack {
                    Text("Y: \(axisY, specifier: "%g")")
                    Stepper("Y Axis", value: $axisY).labelsHidden()
                }
                VStack {
                    Text("Z: \(axisZ, specifier: "%g")")
                    Stepper("Z Axis", value: $axisZ).labelsHidden()
                }
            }.padding()
            Stepper("Change angle: \(changeAngle)", value: $changeAngle, step: 60).padding()
        }
    }
}

struct SpinAmin_Preview: PreviewProvider {
    static var previews: some View {
        SpinAnim()
    }
}
