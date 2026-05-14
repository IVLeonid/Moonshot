//
//  Mission-HighlightsView.swift
//  Moonshot
//
//  Created by Леонід Іванов on 13.05.2026.
//

import SwiftUI

struct MissionHighlightsView: View {
    let mission: Mission
    
    var body: some View {
        
        Text("Mission Highlights")
            .font(.title.bold())
            .padding(.bottom, 5)
        
        Text(mission.description)
        
    }
}



#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    return MissionHighlightsView(mission: missions[1])
        .preferredColorScheme(.dark)
}

