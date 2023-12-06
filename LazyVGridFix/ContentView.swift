//
//  ContentView.swift
//  LazyVGridFix
//
//  Created by Yevhenii Korsun on 06.12.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var showView = false

    private let data = ["1", "2", "3","4", "5", "6", "7", "8", "9","*", "0", "#"]
    
    var body: some View {
        VStack {
            Button("Toggle appearence") {
                withAnimation {
                    showView.toggle()
                }
            }
            
            Spacer()

            if showView {
                LazyVGrid(columns: Array(repeating: GridItem(), count: 3), spacing: 10) {
                    ForEach(data, id: \.self, content: cellContent)
                }
                .fixTransition()
                .transition(.move(edge: .bottom))
            }
        }
    }
    
    private func cellContent(text: String) -> some View {
        Circle()
            .frame(width: 70, height: 70)
            .foregroundColor(.gray)
            .overlay(
                Text(text)
            )
    }
}

#Preview {
    ContentView()
}
