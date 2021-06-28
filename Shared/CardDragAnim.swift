//
//  CardDragAnim.swift
//  Animations (iOS)
//
//  Created by iresh sharma on 27/06/21.
//

import SwiftUI

struct CardAnim: View {
    
    @State private var dragAmount: CGSize = CGSize.zero
    @State private var rotation: Double = 0
    @State private var xAxis: CGFloat = 0
    @State private var yAxis: CGFloat = 0
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing)
            Text("Drag Me!")
                .fontWeight(.black)
                .font(.largeTitle)
                .gradientText([.purple, .black])
        }
            .frame(width: 300.0, height: 200.0)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged() {
                        self.dragAmount = $0.translation
                        if $0.startLocation.y != $0.predictedEndLocation.y {
                            self.xAxis = 1.0
                        }
                        if $0.startLocation.x != $0.predictedEndLocation.x {
                            self.yAxis = 1.0
                        }
                        self.rotation = Double($0.translation.width / -10)
                    }
                    .onEnded() {_ in
                        self.dragAmount = CGSize.zero
                        self.rotation = 0
                        self.xAxis = 0
                        self.yAxis = 0
                    }
            )
            .rotation3DEffect(
                .degrees(rotation),
                axis: (x: xAxis, y: yAxis, z: 0.0)
            )
            .animation(.spring(response: 1, dampingFraction: 1, blendDuration: 500))
    }
}

extension View {
    public func gradientText(_ colors: [Color]) -> some View {
        self.overlay(LinearGradient(gradient: Gradient(colors: colors), startPoint: .leading, endPoint: .trailing))
            .mask(self)
    }
}

struct ContentView: PreviewProvider {
    static var previews: some View {
        CardAnim()
    }
}
