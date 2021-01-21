//
//  Film.swift
//  Tiny App
//
//  Created by Hockey on 12/23/20.
//

import Foundation

// Struct Film thừa hưởng protocol: Decodable
// cho phép nó có thể giải (mã) được trong lúc
// xử lý JSON
struct Film: Decodable {
    let title: String
    let producer: String
    let releaseDate: String
    let desc: String
//    let starships: [String]
    
    
    // CodingKeys:
    // Định nghĩa keys dùng để xử lý cấu trúc JSOn
    // .Trong Trường hợp tên key để parse JSON
    // khác với tên biến (mô tả) thì ta phải khai báo một giá trị mới
    enum CodingKeys: String, CodingKey {
        case releaseDate = "release_date"// key để parse khác với tên biến mô tả
        case title
//        case starships
        case producer
        case desc = "opening_crawl"
    }
}
