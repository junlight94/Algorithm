import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    var progress = progresses
    var speed = speeds
    var result = [Int]()
    
    while !progress.isEmpty {
        var count = 0

        // 모든 프로세스에 speed 더하기
        for i in 0..<progress.count {
            progress[i] = progress[i] + speed[i]
        }
        
        // 앞에 부터 100이 넘는지 확인 100이 넘으면 Count 누적 아니면 탈출
        for i in 0..<progress.count {
            if progress[i] >= 100 {
                count += 1
            } else {
                break
            }
        }

        // Count된 수 만큼 Dequeue, Result의 Dequeue Count 누적
        if count > 0 {
            progress.removeFirst(count)
            speed.removeFirst(count)
            result.append(count)
        }
    }
    
    return result
}
