//
//  Films.swift
//  Tiny App
//
//  Created by Hockey on 12/23/20.
//

import Foundation
struct Films: Decodable {
    let count: Int
    let all: [Film]
    
    enum CodingKeys: String, CodingKey {
        case count
        case all = "results"
    }
}
