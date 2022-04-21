//
//  Counter.swift
//  mvc
//
//  Created by andronick martusheff on 4/17/22.
//

import Foundation

struct Counter {
    
    var count = 0
    var rate = 1
    
    mutating func updateCount(action: String) {
        if action == "+" {
            count += rate
        } else if action == "-" {
            count -= rate
        }
    }
}
