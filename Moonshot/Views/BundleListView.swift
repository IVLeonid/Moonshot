//
//  BundleListView.swift
//  Moonshot
//
//  Created by Леонід Іванов on 15.05.2026.
//

import SwiftUI

struct BundleListView: View {
    
    var astronauts: [String: Astronaut]
    var missions: [Mission]
    
    var body: some View {
        VStack {
            List {
                ForEach(missions) {mission in
                    NavigationLink(value: mission) {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 85, height: 85)
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(Color(.white))
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .padding(.vertical, 5)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                            
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                    .listRowBackground(Color.darkBackground)
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(.plain)
            .scrollContentBackground(.hidden)
        }
        .background(.darkBackground)
        

    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    BundleListView(astronauts: astronauts, missions: missions)
        .preferredColorScheme(.dark)
}
