//
//  Mission.swift
//  Moonshot
//
//  Created by Леонід Іванов on 08.05.2026.
//

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: String?
    let crew: [CrewRole]
    let description: String
}
