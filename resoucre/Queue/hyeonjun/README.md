## 기능개발
문제: https://school.programmers.co.kr/learn/courses/30/lessons/42586

### Flow, 문제 이해 

![IMG_F826F9EC2DCF-1](https://github.com/user-attachments/assets/77e79dc8-4f74-4127-9a34-0269bfda6b50)

### Code
```swift
import Foundation

func solution(_ progresses:[Int], _ speeds:[Int]) -> [Int] {
    
    var taskQueue = progresses
    var speedQueue = speeds
    var results: [Int] = []
    
    while !taskQueue.isEmpty {
    
        for i in 0..<taskQueue.count {
            taskQueue[i] += speedQueue[i]
        }
        
        var cnt = 0
        
        while !taskQueue.isEmpty && taskQueue.first! >= 100 {
            taskQueue.removeFirst()
            speedQueue.removeFirst()
            cnt += 1
        }
        
        if cnt > 0 {
            results.append(cnt)
        }

    }
    
    return results
}
```

### 시간복잡도: O(2N)
<br><br><br>

## 프로세스
문제: [https://school.programmers.co.kr/learn/courses/30/lessons/42586](https://school.programmers.co.kr/learn/courses/30/lessons/42587)

### Flow, 문제 이해 
![IMG_2F3F5556AD04-1](https://github.com/user-attachments/assets/6ecc975e-cc7d-4e18-bb49-8aa58b76b318)


### Code
```swift
import Foundation

func solution(_ priorities:[Int], _ location:Int) -> Int {
    
    var queue: [(index: Int, priority: Int)] = priorities.enumerated().map { (index: $0.offset, priority: $0.element)}
    
    var res: Int = 0
    
    while true {
        
        let item = queue.remove(at: 0)

        if queue.contains { $0.priority > item.priority } {
            queue.append(item)
        } else {
            res += 1
            if item.index == location { return res }
        }
    }
    
    return res
}
```

### 시간복잡도: O(N^2) 

> O(n) + O(n-1) + O(n-2) + O(n-3)... O(1)<br>
> 등차수열 n(n+1) / 2<br>
> n^2 + n / 2<br>
> 최고차항: n^2<br>

