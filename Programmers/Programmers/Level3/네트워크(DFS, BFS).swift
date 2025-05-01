//
//  네트워크(DFS, BFS).swift
//  Programmers
//
//  Created by Junyoung on 5/1/25.
//

import Foundation

func solution_network(_ n:Int, _ computers:[[Int]]) -> Int  {
    // 각 컴퓨터가 방문되었는지 여부를 저장하는 배열
    var visited = [Bool](repeating: false, count: n)
    
    // 네트워크(연결된 덩어리)의 개수를 셈
    var networkCount = 0
    
    // DFS: 현재 컴퓨터(node)에서 연결된 모든 컴퓨터를 방문 처리
    func dfs(_ node: Int) {
        // 현재 노드를 방문했다고 표시
        visited[node] = true
        print("✅ 방문 시작: \(node)번 컴퓨터")
        
        // 0부터 n-1까지 모든 컴퓨터에 대해
        for i in 0..<n {
            // 만약 node와 i가 연결되어 있고, i가 아직 방문되지 않았다면
            if computers[node][i] == 1 && !visited[i] {
                print("🔗 \(node)번 컴퓨터 → \(i)번 컴퓨터 연결됨 (아직 방문 안 함)")
                dfs(i) // 연결된 컴퓨터로 재귀 탐색
            } else if computers[node][i] == 1 && visited[i] {
                print("🔁 \(node)번 컴퓨터 → \(i)번 컴퓨터 연결됨 (이미 방문함)")
            } else {
                print("❌ \(node)번 컴퓨터 → \(i)번 컴퓨터 연결되지 않음")
            }
        }
        print("⬅️ \(node)번 컴퓨터 DFS 종료")
    }
    
    // 모든 컴퓨터에 대해 방문하지 않은 컴퓨터가 있으면 DFS 실행
    for i in 0..<n {
        // 아직 방문하지 않은 컴퓨터라면, 새로운 네트워크의 시작
        if !visited[i] {
            print("==== \(i)번 컴퓨터에서 DFS 시작 ====")
            // 이 컴퓨터를 시작으로 연결된 모든 컴퓨터 방문 처리 + 네트워크 개수 증가
            dfs(i)
            networkCount += 1
            print("🌐 네트워크 개수 증가 → 현재까지 \(networkCount)\n")
        }
    }
    
    return networkCount
}
