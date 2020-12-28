//
//  Films.swift
//  Tiny App
//
//  Created by Hockey on 12/23/20.
//

import Foundation

// Struct Films thừa hưởng protocol Decodable
// cho phép chúng có thể giải (mã) được trong lúc
// xử lý JSON
struct Films: Decodable {
    let count: Int
    let all: [Film]
    
    // CodingKeys:
    // Định nghĩa keys dùng để xử lý cấu trúc JSOn
    // .Trong Trường hợp tên key để parse JSON
    // khác với tên biến thì ta phải khai báo một giá trị mới
    enum CodingKeys: String, CodingKey {
        case count
        case all = "results"
    }
}
