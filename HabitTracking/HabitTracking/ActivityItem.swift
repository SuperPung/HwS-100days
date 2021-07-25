//
//  ActivityItem.swift
//  HabitTracking
//
//  Created by SUPER on 2021/7/25.
//

import Foundation

struct ActivityItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let description: String
    let finishNum: Int
}
