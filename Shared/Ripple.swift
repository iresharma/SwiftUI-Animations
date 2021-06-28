//
//  ContentView.swift
//  Shared
//
//  Created by iresh sharma on 19/06/21.
//

import SwiftUI

struct Ripple: View {
    
    @State private var animationAmount: CGFloat = 1
    
    var body: some View {
        VStack {
            Button(action: {
                
            }) {
                Text("4").font(.footnote).foregroundColor(Color.white)
            }.padding()
            .background(Color.red)
            .clipShape(Circle())
            .overlayAnim(animationAmount: animationAmount, scaleFactor: 0)
            .overlayAnim(animationAmount: animationAmount, scaleFactor: 0.5, delay: true)
            .onAppear {
                self.animationAmount = 2
            }
        }
    }
}

struct overLayModifier: ViewModifier {
    
    var animationAmount: CGFloat
    var scaleFactor: Double
    var delay: Bool
    
    func body(content: Content) -> some View {
        content
            .overlay(
                Circle()
                    .stroke(Color.red)
                    .scaleEffect(animationAmount - CGFloat(scaleFactor))
                    .opacity((2 - Double(animationAmount)))
                    .animation(
                        Animation
                            .easeInOut(duration: 2)
                            .delay(delay ? 0.1 : 0)
                            .repeatForever(autoreverses: false)
                    )
            )
    }
}

extension View {
    func overlayAnim(animationAmount: CGFloat, scaleFactor: Double, delay: Bool = false) -> some View {
        self.modifier(overLayModifier(animationAmount: animationAmount, scaleFactor: scaleFactor, delay: delay))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Ripple()
    }
}
