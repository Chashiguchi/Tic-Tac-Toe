//
//  ContentView.swift
//  Tic Tac Toe
//
//  Created by chase Hashiguchi on 11/14/23.
//

import SwiftUI

struct ContentView: View {
    @State private var moves = Array(repeating: "", count: 9)
    @State private var xTurn = true
    var body: some View {
        VStack {
            Text("Tic Tac Toe")
                .font(.title).bold()
            LazyVGrid(columns: Array(repeating: GridItem(.fixed(120)), count: 3), spacing: 15){
                ForEach(0..<9) { index in
                    ZStack {
                        Color.blue
                        Text(moves[index])
                            .font(.system(size: 90))
                            .fontWeight(.heavy)
                    }
                    .frame(width: 120, height: 120, alignment: .center)
                    .cornerRadius(30)
                    .onTapGesture {
                        withAnimation(.default){
                            if moves[index] == "" {
                                moves[index] = xTurn ? "X" : "O"
                                xTurn.toggle()
                            }
                        }
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
