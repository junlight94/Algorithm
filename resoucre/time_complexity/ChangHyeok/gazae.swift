//
//  main.swift
//  practice
//
//  Created by KangChangHyeok on 9/30/24.
//

import Foundation

var nums: Set<Int> = []
for _ in 1...28 {
    if let number = Int(readLine()!) {
        nums.insert(number)
    }
}

for i in 1...30 {
    if !nums.contains(i) {
        print(i)
    }
}
