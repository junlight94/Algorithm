## 큐(Queue)란?
- 기본적인 자료 구조의 한가지로, 먼저 집어 넣은 데이터가 먼저 나오는 FIFO(First In First Out)구조로 저장하는 형식을 말한다.
- 영어 단어 Queue는 표를 사러 일렬로 늘어선 사람들로 이루어진 줄을 말하기도 하며, 먼저 줄을 선 사람이 먼저 나갈수 있는 상황을 연상하면 된다.
- 나중에 집어넣은 데이터가 먼저 나오는 Statck과는 반대되는 개념이다.
<center><img width="239" alt="스크린샷 2024-10-21 오후 3 40 49" src="https://github.com/user-attachments/assets/f495e772-2c50-4b45-85c3-a717b42db540"></center>


### 다리를 지나는 트럭
```swift
func solution(_ bridge_length: Int, _ weight: Int, _ truck_weights: [Int]) -> Int {
    var time = 0 // 경과 시간
    var bridgeQueue = Array(repeating: 0, count: bridge_length) // 다리 위 상태를 나타내는 큐
    var bridgeWeight = 0 // 현재 다리 위에 있는 트럭들의 총 무게
    var waitingTrucks = truck_weights // 대기 중인 트럭들
    
    while !bridgeQueue.isEmpty { // 다리위 차량이 없을때까지 반복
        time += 1// 1초씩 증가
        // 트럭이 다리를 지나면 무게에서 뺌
        bridgeWeight -= bridgeQueue.removeFirst()
        
        // 대기 트럭이 있을 경우 처리
        if let nextTruck = waitingTrucks.first {
            // 다리에 트럭이 올라갈 수 있는지 확인
            if bridgeWeight + nextTruck <= weight {
                // 트럭이 올라가면 무게를 추가하고, 대기 트럭에서 제거
                bridgeQueue.append(nextTruck)
                bridgeWeight += nextTruck
                waitingTrucks.removeFirst()
            } else {
                // 트럭이 올라가지 못하면 빈 공간을 추가
                bridgeQueue.append(0)
            }
        } else if bridgeWeight == 0 {
            // 모든 트럭이 지나갔다면 종료
            break
        }
    }
    
    return time
}
```

### 기능개발
```swift
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
```

### 프로세스
```swift
func solution(_ priorities:[Int], _ location:Int) -> Int {
    var priorities = priorities.enumerated().map { index, priority in
        (index: index, priority: priority)
    }
    
    var complete: [(Int, Int)] = []

    while let firstPriorities = priorities.first {
        let high = priorities.max { $0.priority < $1.priority }
        if firstPriorities.priority == high!.priority {
            complete.append(priorities.removeFirst())
        } else {
            priorities.append(priorities.removeFirst())
        }
    }

    print(priorities)
    print(complete)
    return complete.firstIndex { index, priority in
        index == location
    }! + 1
}
```
