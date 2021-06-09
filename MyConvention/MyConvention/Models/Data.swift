//
//  Data.swift
//  MyConvention
//
//  Created by SUPER on 2021/6/9.
//

import Foundation

let MetricUnits: [VolumeUnit] = load("MetricUnits.json")
let EnglishUnits: [VolumeUnit] = load("EnglishUnits.json")
let AllUnits: [VolumeUnit] = load("AllUnits.json")
let temp = 0

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle: \n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self): \n\(error)")
    }
}
