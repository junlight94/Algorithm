func solution(_ bridge_length:Int, _ weight:Int, _ truck_weights:[Int]) -> Int {
    
    var count = 0
    var bridgeQueue = Array(repeating: 0, count: bridge_length)
    var trucks = truck_weights
    var sumWeight = 0
    
    // 다리 위에 차가 다 없어질 때 까지 반복
    while !bridgeQueue.isEmpty {
        
        // 1회 반복 마다 1초를 증가
        count += 1
        
        // 다리의 맨 앞에 차가 지나가면 그만큼 다리 위의 무게 제거
        sumWeight -= bridgeQueue.removeFirst()
        
        if let truct = trucks.first {
            // 트럭 대기열 첫 번째 + 다리 위의 트럭들의 무게 <= 다리가 버틸 수 있는 무게
            if truct + sumWeight <= weight {
                // 다음 트럭이 들어올 수 있다면
                // 트럭 리스트의 맨 앞의 트럭 제거
                // 다리 위의 트럭 Queue에 enqueue
                sumWeight += trucks.removeFirst()
                bridgeQueue.append(truct)
            } else {
                // 만약 트럭이 더 이상 들어갈 수 없다면
                bridgeQueue.append(0)
            }
        }
    }
    
    return count
}
