//
//  MemCache.swift
//  Tiny App
//
//  Created by Hockey on 1/11/21.
//

import Foundation

class MemCache {
    static var shared = MemCache()
    private init() {
        
    }
    // Định nghĩa biến lưu trữ
    var data: [String: Any]?
}
