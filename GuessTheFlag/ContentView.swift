//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by Андрей Кузнецов on 07.02.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.white, .blue,.red], startPoint: .topLeading, endPoint: .bottomTrailing )
            Text("Tanya is the best!")
                .fontWeight(.bold)
                .font(.title)
                .foregroundColor(.primary)
                .padding(50)
                .background(.ultraThinMaterial)
        }
        .ignoresSafeArea()

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
