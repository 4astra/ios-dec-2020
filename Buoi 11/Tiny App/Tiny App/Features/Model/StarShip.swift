//
//  StarShip.swift
//  Tiny App
//
//  Created by Hockey on 1/16/21.
//

import Foundation

struct StarShip: Decodable {
    let name: String
    let manufacturer: String
    let length: String
    let passengers: String
    let model: String
    let image: String
    
    enum CodingKeys: String, CodingKey {
        case model = "starship_class"
        case name
        case manufacturer
        case length
        case passengers
        case image
    }
    
}
