## heap
- 힙은 최댓값 및 최솟값을 찾아내는 연산을 빠르게 하기 위해 고안된 완전이진트리를 기본으로 한 자료구조이다.
- 각 노드의 자식노드의 최대개수는 힙의 종류에 따라 다르지만, 대부분의 경우는 자식노드의 갯수가 최대 2개인 이진 힙을 사용한다.
- 이진 힙의 시간복잡도는 O(logn)
### 완전이진트리
- 이진 트리는 트리를 구성하는 모든 노드가 최대 두개의 자식 노드를 가지는 자료구조이다.
- 각 높이에 있는 모든 노드가 자식 노드를 가져야 다음 높이에 새 노드를 추가할수 있고, 가장 왼쪽부터 차례대로 노드를 채워야 한다.
### 힙의 두가지 종류 
#### 최대 힙
- 부모노드의 키 값이 자식노드의 키값보다 항상 큰 힙
#### 최소 힙
- 부모노드의 키 값이 자식노드의 키 값보다 항상 작은 힙

### 힙 구현(소들이님 코드 참고)
```swift
struct Heap<T: Comparable> {
    
    var elements: [T] = []
    
    var count: Int {
        return elements.count - 1
    }
    
    var isEmpty: Bool {
        return elements.count <= 1
    }
    
    init(_ element: T) {
        elements.append(element) // 0번 인덱스 채우기용
        elements.append(element)
    }
    
    func leftChild(_ index: Int) -> Int {
        return index * 2
    }
    
    func rightChild(_ index: Int) -> Int {
        return (index * 2) + 1
    }
    func parent(_ index: Int) -> Int {
        return index / 2
    }
    
    mutating func insert(_ element: T) {
        if elements.count == 0 {
            elements.append(element)
            elements.append(element)
        }
        
        elements.append(element)
        
        func isMoveUp(_ insertIndex: Int) -> Bool {
            if insertIndex <= 1 {
                return false
            }
            let parentIndex = parent(insertIndex)
            return elements[insertIndex] >  elements[parentIndex] ? true : false
        }
        
        var insertIndex: Int = elements.count - 1
        
        while isMoveUp(insertIndex) {
            let parentIndex = insertIndex / 2
            elements.swapAt(insertIndex, parentIndex)
            insertIndex = parentIndex
        }
    }
    
    enum moveDownStatus { case none, left, right }
    
    mutating func pop() -> T? {
        if elements.count <= 1 { return nil }
        
        elements.swapAt(1, self.count)
        let returnData = elements.removeLast()
        
        func moveDown(_ poppedIndex: Int) -> moveDownStatus {
            let leftChildIndex = leftChild(poppedIndex)
            let rightChildIndex = rightChild(poppedIndex)
                
                // case 1. 모든(왼쪽) 자식 노드가 없는 경우 (완전이진트리는 왼쪽부터 채워지므로)
                if leftChildIndex >= self.count {
                    return .none
                }
                
                // case 2. 왼쪽 자식 노드만 있는 경우
                if rightChildIndex >= self.count {
                    return elements[leftChildIndex] > elements[poppedIndex] ? .left : .none
                }
                
                // case 3. 왼쪽 & 오른쪽 자식 노드 모두 있는 경우
                // case 3-1. 자식들이 자신보다 모두 작은 경우
                if (elements[leftChildIndex] < elements[poppedIndex]) && (elements[rightChildIndex] < elements[poppedIndex]) {
                    return .none
                }
                
                // case 3-2. 자식들이 자신보다 모두 큰 경우 (왼쪽과 오른쪽 자식 중 더 큰 자식 선별)
                if (elements[leftChildIndex] > elements[poppedIndex]) && (elements[rightChildIndex] > elements[poppedIndex]) {
                    return elements[leftChildIndex] > elements[rightChildIndex] ? .left : .right
                }
                
                // case 3-3. 왼쪽 & 오른쪽 중 한 자식만 자신보다 큰 경우
                return elements[leftChildIndex] > elements[poppedIndex] ? .left : .right
            }
            
            // 루트 노드와 스왑된 맨 마지막 리프의 노드를 moveDownt시켜 올바른 위치로 옮겨야함
            var poppedIndex = 1
            while true {
                switch moveDown(poppedIndex) {
                case .none: //해당 case일때 모든 노드의 정렬이 완료된 상태
                    return returnData
                case .left: // 왼쪽 자식 노드가 더 값이 큰 경우
                    let leftChildIndex = poppedIndex * 2
                    elements.swapAt(poppedIndex, leftChildIndex)
                    poppedIndex = leftChildIndex
                case .right: // 오른쪽 자식 노드가 더 값이 큰 경우
                    let rightChildIndex = (poppedIndex * 2) + 1
                    elements.swapAt(poppedIndex, rightChildIndex)
                    poppedIndex = rightChildIndex
                }
            }
    }
}
```

https://babbab2.tistory.com/109
