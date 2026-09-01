//
//  MissionView.swift
//  Moonshot
//
//  Created by Леонід Іванов on 11.05.2026.
//
import SwiftUI


struct MissionView: View {

    let mission: Mission
    let crew: [MissionCrewView.CrewMember]
    
    var body: some View {
        ScrollView {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) { width, axis in width * 0.6
                    }
                    .padding(.top)
                    .accessibilityHidden(true)
                
                VStack(alignment: .leading) {
                    CustomRectangle()
                    
                    Text(mission.formattedLaunchDate)
                        .font(.title.bold())
                        .padding(.bottom, 5)
                        .foregroundStyle(Color(.secondaryLabel))
                    
                    CustomRectangle()
                    
                    //Mission Highlights
                    MissionHighlightsView(mission: mission)
                    
                    CustomRectangle()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                        .accessibilityHint("\(crew.count) members")
                }
                .padding(.horizontal)
                
                //Mission Crew
                MissionCrewView(crew: crew)
            }
            .padding(.bottom)
        }
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    struct CustomRectangle: View {
        var body: some View {
            Rectangle()
                .frame(height: 2)
                .foregroundStyle(.lightBackground)
                .padding(.vertical)
        }
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return MissionCrewView.CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
}




#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")

    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
