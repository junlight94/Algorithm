//
//  프렌즈4블록.swift
//  Programmers
//
//  Created by Junyoung on 5/7/25.
//

import Foundation

func solution_friend(_ m:Int, _ n:Int, _ board:[String]) -> Int {
    
    var end = false
    var map = board.map { Array($0).map{ String($0) }}
    var count = 0
    
    while !end {
        end = true
        
        var check = [[Bool]](repeating: [Bool](repeating: false, count: n), count: m)
        
        for x in 0..<m - 1 {
            for y in 0..<n - 1 {
                let now = map[x][y]
                let right = map[x][y+1]
                let down = map[x+1][y]
                let rightDown = map[x+1][y+1]
                
                if now == right, right == down, down == rightDown, now != "-" {
                    end = false
                    check[x][y] = true
                    check[x][y+1] = true
                    check[x+1][y] = true
                    check[x+1][y+1] = true
                }
            }
        }
        
        for x in 0..<m {
            for y in 0..<n {
                if check[x][y] {
                    map[x][y] = "-"
                    count += 1
                }
            }
        }
        
        // 코드 개선 필요
        for y in 0..<n {
            for x in stride(from: m - 1, through: 0, by: -1) {
                if map[x][y] == "-" {
                    for k in stride(from: x - 1, through: 0, by: -1) {
                        if map[k][y] != "-" {
                            map[x][y] = map[k][y]
                            map[k][y] = "-"
                            break
                        }
                    }
                }
            }
        }
    }
    
    return count
}
