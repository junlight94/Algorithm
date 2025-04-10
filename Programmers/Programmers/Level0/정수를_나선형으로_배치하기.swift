//
//  정수를_나선형으로_배치하기.swift
//  Programmers
//
//  Created by Junyoung Lee on 4/10/25.
//

import Foundation

//print(solution(5))

func solution(_ n:Int) -> [[Int]] {
    var result = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    // 방향: 오른쪽, 아래, 왼쪽, 위
    let dx = [0, 1, 0, -1]
    let dy = [1, 0, -1, 0]
    
    var x = 0
    var y = 0
    var dir = 0 // 방향 인덱스 (0: 오른쪽, 1: 아래, 2: 왼쪽, 3:위)
    var num = 1
    
    for _ in 0..<(n * n) {
        result[x][y] = num
        num += 1
        
        // 다음 위치 미리 계산
        let nx = x + dx[dir]
        let ny = y + dy[dir]
        
        // 경계 조건 또는 이미 값이 있는 경우 → 방향 전환
        if nx < 0 || nx >= n || ny < 0 || ny >= n || result[nx][ny] != 0 {
            dir = (dir + 1) % 4
        }
        
        // 방향 전환 후 새로운 방향으로 이동
        x += dx[dir]
        y += dy[dir]
    }
    
    return result
}
