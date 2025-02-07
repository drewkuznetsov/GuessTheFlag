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
            VStack(spacing: 0) {
                Color(.white)
                Color(.blue)
                Color(.red)
            }
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
