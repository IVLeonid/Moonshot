//
//  BundleGridView.swift
//  Moonshot
//
//  Created by Леонід Іванов on 15.05.2026.
//

import SwiftUI

struct BundleGridView: View {
    
    var astronauts: [String: Astronaut]
    var missions: [Mission]
    
    let columns = [
        GridItem(.adaptive(minimum: 100))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) {mission in
                    NavigationLink(value: mission) {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(Color(.white))
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                            )
                    }
                    .accessibilityElement()
                    .accessibilityLabel("\(mission.displayName), date of launch: \(mission.formattedLaunchDate)")
                }
            }
            .padding([.horizontal, .bottom])
        }
        .background(.darkBackground)

    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    BundleGridView(astronauts: astronauts, missions: missions)
        .preferredColorScheme(.dark)
}
