//
//  모의고사.swift
//  Programmers
//
//  Created by Junyoung on 4/26/25.
//

import Foundation
func solution_mo(_ answers:[Int]) -> [Int] {
    let first = [1, 2, 3, 4, 5]
    let second = [2, 1, 2, 3, 2, 4, 2, 5]
    let third = [3, 3, 1, 1, 2, 2, 4, 4, 5, 5]
    
    var count: [Int] = [0 , 0, 0]
    var result: [Int] = []
    
    for i in 0..<answers.count {
        if answers[i] == first[i % first.count] {
            count[0] += 1
        }
        if answers[i] == second[i % second.count] {
            count[1] += 1
        }
        if answers[i] == third[i % third.count] {
            count[2] += 1
        }
    }
    
    let max = count.max()!
    count.enumerated().forEach { (index, element) in
        if element == max {
            result.append(index + 1)
        }
    }
    
    return result
}

