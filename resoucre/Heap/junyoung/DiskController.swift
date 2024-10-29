import Foundation

func solution(_ jobs:[[Int]]) -> Int {
    
    // 우선 순위 큐
    var queue = PriorityQueue<Int>()
    
    // value를 우선 순위로 둔 큐
    var jobsQueue = PriorityQueue<Int>()
    var job = [(priority: Int, value: Int)]()
    
    jobs.forEach {
        queue.enqueue(value: $0[1], priority: $0[0])
    }
    
    var currentTime = 0
    var totalTime = 0
    var savedTime = 0

    while !queue.isEmpty || !jobsQueue.isEmpty || !job.isEmpty {
        
        // currentTime보다 작은 값을 빼서 값으로 우선순위 정렬
        while let peek = queue.peek()?.priority, peek <= currentTime {
            guard let dequeue = queue.dequeue() else { continue }
            jobsQueue.enqueue(value: dequeue.priority, priority: dequeue.value)
        }
        
        if currentTime == savedTime && !job.isEmpty {
            totalTime += currentTime - job[0].priority
            job.removeAll()
        }
        
        // currentTime보다 같거나 작다면 jobQueue 안으로
        if let peek = jobsQueue.peek(), peek.value <= currentTime && job.isEmpty {
            let dequeue = jobsQueue.dequeue()!
            job.append((dequeue.value, dequeue.priority))
            
            savedTime = currentTime + dequeue.priority
        }
        currentTime += 1
    }
    
    return totalTime / jobs.count
}

struct PriorityQueue<T: Comparable> {
    private var heap: [Element<T>] = []
    
    var isEmpty: Bool {
        return heap.isEmpty
    }
    
    mutating func enqueue(value: T, priority: Int) {
        let element = Element(priority: priority, value: value)
        heap.append(element)
        heapifyUp(from: heap.count - 1)
    }
    
    mutating func dequeue() -> Element<T>? {
        guard !heap.isEmpty else { return nil }
        
        if heap.count == 1 {
            return heap.removeFirst() // 요소가 하나뿐일 때 바로 반환
        } else {
            let root = heap[0]
            heap[0] = heap.removeLast() // 마지막 요소를 루트로 이동
            heapifyDown(from: 0) // 재정렬
            return root
        }
    }
    
    func peek() -> Element<T>? {
        return heap.first
    }
    
    // heapify-up: 새 요소를 삽입 후 위로 정렬
    private mutating func heapifyUp(from index: Int) {
        var childIndex = index
        let element = heap[childIndex]
        var parentIndex = (childIndex - 1) / 2

        while childIndex > 0 && element < heap[parentIndex] {
            heap[childIndex] = heap[parentIndex]
            childIndex = parentIndex
            parentIndex = (childIndex - 1) / 2
        }
        heap[childIndex] = element
    }

    // heapify-down: 최상위 요소 제거 후 아래로 정렬
    private mutating func heapifyDown(from index: Int) {
        var parentIndex = index
        let count = heap.count

        while true {
            let leftChildIndex = 2 * parentIndex + 1
            let rightChildIndex = 2 * parentIndex + 2
            var highestPriorityIndex = parentIndex

            // 왼쪽 자식과 비교
            if leftChildIndex < count && heap[leftChildIndex] < heap[highestPriorityIndex] {
                highestPriorityIndex = leftChildIndex
            }
            
            // 오른쪽 자식과 비교
            if rightChildIndex < count && heap[rightChildIndex] < heap[highestPriorityIndex] {
                highestPriorityIndex = rightChildIndex
            }

            // 더 이상 교환이 필요 없으면 종료
            if highestPriorityIndex == parentIndex { return }
            
            // 부모와 가장 높은 우선순위 자식 교환
            heap.swapAt(parentIndex, highestPriorityIndex)
            parentIndex = highestPriorityIndex
        }
    }
}

struct Element<T: Comparable>: Comparable {
    let priority: Int // 우선순위 (숫자가 작을수록 우선순위가 높다고 가정)
    let value: T // 실제 값

    // 비교 연산자 정의 (우선순위가 낮을수록 높은 우선순위로 간주)
    static func < (lhs: Element, rhs: Element) -> Bool {
        return lhs.priority < rhs.priority
    }
}
