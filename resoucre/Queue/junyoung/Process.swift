import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priorities = priorities
    var location = location
    var executed = 0
    
    while true {
        
        // Dequeue
        // 커서 위치 -1
        let first = priorities.removeFirst()
        location -= 1
        
        if first >= priorities.max() ?? 0 {
            // Dequeue가 프로세스 목록에 있는 우선순위보다 높다면 실행 숫자 +1
            executed += 1
        } else {
            // Dequeue가 프로세스 목록에 있는 우선순위보다 낮다면 EnQueue
            priorities.append(first)
            
            if location < 0 {
                // 커서 위치 큐의 마지막으로 이동
                location = priorities.count - 1
            }
        }
        
        // location이 0 보다 작다면 원하는 값이 Queue서 나옴
        if location < 0 {
            break
        }
    }
    
    return executed
}
