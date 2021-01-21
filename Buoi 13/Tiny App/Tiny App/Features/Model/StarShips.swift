//
//  StarShips.swift
//  Tiny App
//
//  Created by Hockey on 1/16/21.
//

import Foundation

struct StarShips: Decodable {
    let all: [StarShip]
    
    enum CodingKeys: String, CodingKey {
        case all = "results"
    }
}
