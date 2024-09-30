//
//  main.swift
//  practice
//
//  Created by KangChangHyeok on 9/30/24.
//

import Foundation

var input = readLine()


func calculateLeapYear(input: Int) -> Int {
    if (input % 4 == 0) && (input % 100 != 0) {
        return 1
    } else if input % 400 == 0 {
        return 1
    } else {
        return 0
    }
}


if let input = input {
    let input = Int(input)!
    print(calculateLeapYear(input: input))
}
