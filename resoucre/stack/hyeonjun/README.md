# 괄호 문제

### flow
![IMG_34D1566BDC90-1](https://github.com/user-attachments/assets/e662c589-0837-4ac3-b545-e5b04e2c6760)

### Code
![image](https://github.com/user-attachments/assets/8e8a7059-748e-4205-b456-0a289793f78f)

#### 시간복잡도: O(N)


# 스택 수열

### flow
![image](https://github.com/user-attachments/assets/8e2380d8-2c92-40e1-b4bc-d19f9bc87bdc)

### Code
```swift
import Foundation 

let n = Int(readLine()!)!

var now = 1
var result = ""
var stack: [Int] = [] 

for _ in 0..<n {
    
    let input = Int(readLine()!)!
    
    while now <= input {
        stack.append(now)
        result += "+"
        now += 1
    }
    
    if stack.last == input {
        result += "-"
        stack.removeLast()
    } else {
        print("NO")
        exit(0)
    }
}

result.forEach { print($0) }

```

#### 시간복잡도: O(N)
