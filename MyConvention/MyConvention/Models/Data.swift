//
//  Data.swift
//  MyConvention
//
//  Created by SUPER on 2021/6/9.
//

import Foundation

let MetricUnits = [VolumeUnit(id: 0, unitName: "milliliter", ratio: 1.0),
                   VolumeUnit(id: 1, unitName: "liter", ratio: 1000.0),
                   VolumeUnit(id: 2, unitName: "cubic meter", ratio: 1000000.0)]
let EnglishUnits = [VolumeUnit(id: 0, unitName: "cubic inch", ratio: 1.0),
                    VolumeUnit(id: 1, unitName: "cubic foot", ratio: 1728.0),
                    VolumeUnit(id: 2, unitName: "cubic yard", ratio: 46656.0),
                    VolumeUnit(id: 3, unitName: "pint", ratio: 28.875),
                    VolumeUnit(id: 4, unitName: "gallon", ratio: 231.0)]
