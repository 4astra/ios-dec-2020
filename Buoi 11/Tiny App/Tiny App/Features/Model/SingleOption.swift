//
//  SingleOption.swift
//  Tiny App
//
//  Created by Hockey on 12/28/20.
//

import Foundation

class SingleOption {
    
    var title: String?
    var isSelected = false
    
}

// Extension cho phép chúng ta viết thêm phần mở rộng
// Ở đây SingleOption:
// sử dụng protocol CustomStringConvertible này để
// viết thêm phần Format khi chúng ta
// log/print đối tượng SingleOption

extension SingleOption: CustomStringConvertible {
    var description: String {
        "Tên tiêu đề: \(title ?? ""), đã chọn: \(isSelected)"
    }
}
