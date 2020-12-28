//
//  Film.swift
//  Tiny App
//
//  Created by Hockey on 12/23/20.
//

import Foundation

struct Film: Decodable {
    let title: String
    let producer: String
    let releaseDate: String
    let starships: [String]
    
    enum CodingKeys: String, CodingKey {
        case releaseDate = "release_date"
        case title
        case starships
        case producer
    }
}
