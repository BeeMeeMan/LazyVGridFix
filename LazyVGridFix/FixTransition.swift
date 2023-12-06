//
//  FixTransition.swift
//  LazyVGridFix
//
//  Created by Yevhenii Korsun on 06.12.2023.
//

import SwiftUI

fileprivate struct FixTransition: ViewModifier {
    @State var isPresented: Bool = false
    let delaySec: Double
    
    func body(content: Content) -> some View {
        content
            .opacity(isPresented ? 1 : 0)
            .background {
                ScrollView {
                    content
                }
                .allowsTightening(false)
                .opacity(isPresented ? 0 : 1)
            }
            .task {
                try? await Task.sleep(nanoseconds: UInt64(delaySec * 1000_000_000))
                isPresented = true
            }
    }
}

extension View {
    func fixTransition(delaySec: Double = 0.45) -> some View {
        modifier(FixTransition(delaySec: delaySec))
    }
}
