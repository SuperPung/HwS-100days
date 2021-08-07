//
//  Result.swift
//  BucketList
//
//  Created by SUPER on 2021/8/7.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int : Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
