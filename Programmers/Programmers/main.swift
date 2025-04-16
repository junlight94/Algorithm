//
//  main.swift
//  Programmers
//
//  Created by Junyoung Lee on 4/10/25.
//

import Foundation

print(mainSolution([4, 2, 6, 1, 7, 6]))

func mainSolution(_ num_list:[Int]) -> Int {
    let odd = num_list.enumerated().filter { $0.offset % 2 != 0 }.map { $0.element }.reduce(0, +)
    let even = num_list.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }.reduce(0, +)
    
    return odd > even ? odd : even
}
