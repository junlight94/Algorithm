### 기능개발
문제: https://school.programmers.co.kr/learn/courses/30/lessons/42586

## Flow, 문제 이해 

![IMG_F826F9EC2DCF-1](https://github.com/user-attachments/assets/77e79dc8-4f74-4127-9a34-0269bfda6b50)

## Code
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

## 시간복잡도: O(2N)
