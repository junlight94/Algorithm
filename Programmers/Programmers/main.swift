//
//  main.swift
//  Programmers
//
//  Created by Junyoung Lee on 4/10/25.
//

import Foundation

print(mainSolution([44, 1, 0, 0, 31, 25], [31, 10, 45, 1, 6, 19]))
func mainSolution(_ lottos: [Int], _ win_nums: [Int]) -> [Int] {
    let zeroCount = lottos.filter { $0 == 0 }.count
    let winCount = win_nums.filter { lottos.contains($0) }.count
    
    return [min(7 - winCount - zeroCount, 6), min(7 - winCount, 6)]
}
