//
//  Mission.swift
//  Moonshot
//
//  Created by SUPER on 2021/7/22.
//

import Foundation

struct Mission: Codable, Identifiable {
    struct CrewRole: Codable {
        let name: String
        let role: String
    }
    
    let id: Int
    let launchDate: Date?
    let crew: [CrewRole]
    let description: String
    
    var displayName: String {
        "Apollo \(id)"
    }
    
    var image: String {
        "apollo\(id)"
    }
    
    var formattedLaunchDate: String {
        if let launchDate = launchDate {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter.string(from: launchDate)
        } else {
            return "N/A"
        }
    }
    
    var formattedCrewName: String {
        var res = ""
        
        for index in 0 ..< crew.count {
            res.append(crew[index].name)
            if (index < crew.count - 1) {
                res.append(", ")
            }
        }
        
        return res
    }
}
