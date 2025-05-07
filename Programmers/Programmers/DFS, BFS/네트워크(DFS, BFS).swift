//
//  네트워크(DFS, BFS).swift
//  Programmers
//
//  Created by Junyoung on 5/1/25.
//

import Foundation

/*
 문제 설명
 네트워크란 컴퓨터 상호 간에 정보를 교환할 수 있도록 연결된 형태를 의미합니다. 예를 들어, 컴퓨터 A와 컴퓨터 B가 직접적으로 연결되어있고, 컴퓨터 B와 컴퓨터 C가 직접적으로 연결되어 있을 때 컴퓨터 A와 컴퓨터 C도 간접적으로 연결되어 정보를 교환할 수 있습니다. 따라서 컴퓨터 A, B, C는 모두 같은 네트워크 상에 있다고 할 수 있습니다.

 컴퓨터의 개수 n, 연결에 대한 정보가 담긴 2차원 배열 computers가 매개변수로 주어질 때, 네트워크의 개수를 return 하도록 solution 함수를 작성하시오.

 제한사항
 컴퓨터의 개수 n은 1 이상 200 이하인 자연수입니다.
 각 컴퓨터는 0부터 n-1인 정수로 표현합니다.
 i번 컴퓨터와 j번 컴퓨터가 연결되어 있으면 computers[i][j]를 1로 표현합니다.
 computer[i][i]는 항상 1입니다.
 
 입출력 예
 n    computers                            return
 3    [[1, 1, 0], [1, 1, 0], [0, 0, 1]]    2
 3    [[1, 1, 0], [1, 1, 1], [0, 1, 1]]    1

 */

func solution_network_dfs_recrusive(_ n:Int, _ computers:[[Int]]) -> Int  {
    // 각 컴퓨터가 방문되었는지 여부를 저장하는 배열
    var visited = [Bool](repeating: false, count: n)
    var visitedArr = [Int]()
    // 네트워크(연결된 덩어리)의 개수를 셈
    var networkCount = 0
    
    // DFS: 현재 컴퓨터(node)에서 연결된 모든 컴퓨터를 방문 처리
    func dfs(_ node: Int) {
        // 현재 노드를 방문했다고 표시
        visited[node] = true
        visitedArr.append(node)
        print("✅ 방문 노드: \(visitedArr.map{ $0 + 1 })")
        print("✅ 방문 시작: \(node + 1)번 컴퓨터")
        
        // 0부터 n-1까지 모든 컴퓨터에 대해
        for i in 0..<n {
            // 만약 node와 i가 연결되어 있고, i가 아직 방문되지 않았다면
            if computers[node][i] == 1 && !visited[i] {
                print("🔗 \(node + 1)번 컴퓨터 → \(i + 1)번 컴퓨터 연결됨 (아직 방문 안 함)")
                print("🔗 \(i + 1)번 컴퓨터 재귀 탐색 시작")
                dfs(i) // 연결된 컴퓨터로 재귀 탐색
            } else if computers[node][i] == 1 && visited[i] {
                print("🔁 \(node + 1)번 컴퓨터 → \(i + 1)번 컴퓨터 연결됨 (이미 방문함)")
            } else {
                print("❌ \(node + 1)번 컴퓨터 → \(i + 1)번 컴퓨터 연결되지 않음")
            }
        }
        print("⬅️ \(node + 1)번 컴퓨터 DFS 종료")
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

func solution_network_bfs_queue(_ n:Int, _ computers:[[Int]]) -> Int  {
    var visited = [Bool](repeating: false, count: n)
    var networkCount = 0
    var visitedArr = [Int]()
    
    for i in 0..<n {
        if !visited[i] {
            var queue = [i]  // 큐 초기화
            print("==== \(i + 1)번 컴퓨터에서 BFS 시작 ====")
            
            while !queue.isEmpty {
                let node = queue.removeFirst()
                print("✅ 방문 시작: \(node + 1)번 컴퓨터")

                if visited[node] {
                    print("🔁 \(node + 1)번 컴퓨터 이미 방문함 → 스킵")
                    continue
                }
                
                visited[node] = true
                print("✅ \(node + 1)번 컴퓨터 방문")
                
                visitedArr.append(node)
                print("✅ 방문 노드: \(visitedArr.map{ $0 + 1 })")
                
                for j in 0..<n {
                    if computers[node][j] == 1 && !visited[j] {
                        print("🔗 \(node + 1) → \(j + 1) 연결됨 (큐에 추가)")
                        queue.append(j)
                        print("🔗 큐: \(queue.map { $0 + 1})")
                    } else if computers[node][j] == 1 && visited[j] {
                        print("🔁 \(node + 1) → \(j + 1) 연결됨 (이미 방문)")
                    } else {
                        print("❌ \(node + 1) → \(j + 1) 연결되지 않음")
                    }
                }
            }
            
            networkCount += 1
            print("🌐 네트워크 개수 증가 → 현재까지 \(networkCount)\n")
        }
    }
    
    return networkCount
}
