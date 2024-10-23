import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    // 결국 progresses 첫번째 아이템이 완료되었을때 완료가 된 프로세스를 한번에 처리 가능, 그때 날짜를 리턴값 배열에 저장하면 됨
    var progresses: [Int] = progresses
    var speeds: [Int] = speeds
    var completed: [Int] = []
    var result: [Int] = []
    
    while !progresses.isEmpty { // 작업이 완료될때까지 계속 실행
        //1초마다 프로세스에 작업시간 만큼 진행됨
        progresses.enumerated().forEach { index, progress in
            progresses[index] += speeds[index]
        }
        
        while let firstProgress = progresses.first, firstProgress >= 100 {
            completed.append(progresses.removeFirst())
            speeds.removeFirst()
        }
        if !completed.isEmpty {
            result.append(completed.count)
            completed.removeAll()
        }
    }
    return result
}
