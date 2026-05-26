//
//  MissionCrewView.swift
//  Moonshot
//
//  Created by Леонід Іванов on 14.05.2026.
//

import SwiftUI

struct MissionCrewView: View {
    
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink(value: crewMember.astronaut) {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(.capsule)
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )
                            
                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}


#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let dummyCrew = [
        MissionCrewView.CrewMember(role: "Commander", astronaut: astronauts["grissom"]!)
    ]
    MissionCrewView(crew: dummyCrew)
        .preferredColorScheme(.dark)
}
