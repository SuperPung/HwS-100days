//
//  Units.swift
//  MyConvention
//
//  Created by SUPER on 2021/6/9.
//

import Foundation

struct VolumeUnits: Hashable, Codable, Identifiable {
    var id: Int
    var category: String
    var items: [VolumeUnit]
}

struct VolumeUnit: Hashable, Codable, Identifiable {
    var id: Int
    var unitName: String
    var ratio: Double
}
