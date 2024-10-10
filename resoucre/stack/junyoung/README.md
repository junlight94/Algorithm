# 문제 풀이
### 괄호
[백준 실버4, 괄호](https://github.com/junlight94/Algorithm/blob/main/resoucre/stack/junyoung/Parentheses.swift)

```swift
for char in result {
        if char == "(" {
            stack.append(String(char))
        } else {
            guard !stack.isEmpty else { return "NO" }
            stack.removeLast()
        }
    }
    
    return stack.isEmpty ? "YES" : "NO"
```
문자열 `(`가 나오면 스택에 넣고 `)` 나오면 스택의 마지막을 pop합니다.

만약 `)`가 나왔을때 스택이 비어있다면 Early return 으로 "NO"를 리턴합니다.

<br>

```swift
var count = 0
    
    for char in result {
        if char == "(" {
            count += 1
        } else { 
            guard count > 0 else { return false }
            count -= 1
        }
    }
```

`removeLast`, `append` 시간 복잡도가 O(N)이여서 count를 활용한다면 더욱 빠르다.

![스크린샷 2024-10-10 오후 11 53 04](https://github.com/user-attachments/assets/d3a7e5d2-7390-4221-9c8e-b8a54b594edf)

<br>


