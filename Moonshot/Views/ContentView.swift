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
    @State private var showingGridBundle: Bool = false


    var body: some View {
        NavigationStack {
            Group {
                if showingGridBundle {
                    BundleGridView(astronauts: astronauts, missions: missions)
                } else {
                    BundleListView(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .navigationDestination(for: Mission.self) { mission in
                MissionView(mission: mission, astronauts: astronauts)
            }
            .navigationDestination(for: Astronaut.self) { astronaut in
                AstronautView(astronaut: astronaut)
            }
            .toolbar {
                Button {
                    showingGridBundle.toggle()
                } label: {
                    if showingGridBundle {
                        Image(systemName: "list.dash")
                    } else {
                        Image(systemName: "square.grid.2x2")
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
