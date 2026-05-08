//
//  ContentView.swift
//  Moonshot
//
//  Created by Леонід Іванов on 05.05.2026.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")

    var body: some View {
        VStack {
            
        }
    }
}

#Preview {
    ContentView()
}
