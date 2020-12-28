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

extension SingleOption: CustomStringConvertible {
    var description: String {
        "Title: \(title ?? "")"
    }
}
