//
//  ContentView.swift
//  Animations
//
//  Created by noor on 2/16/25.
//

import SwiftUI

struct RotateCornerModifier : ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot : AnyTransition {
        .modifier(active: RotateCornerModifier(amount: -90, anchor: .topLeading),
                identity: RotateCornerModifier(amount:0, anchor: .topLeading)
        )
    }
}

struct ContentView: View {
    @State private var IsRedRectShowing = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height:200)
            
            if IsRedRectShowing {
                Rectangle()
                    .fill(.red)
                    .frame(width: 300, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                IsRedRectShowing.toggle()
            }
        }
        
    }
}

#Preview {
    ContentView()
}
