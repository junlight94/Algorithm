## 괄호
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

![스크린샷 2024-10-10 오후 11 53 04](https://github.com/user-attachments/assets/d3a7e5d2-7390-4221-9c8e-b8a54b594edf)

<br>

[프로그래머스의 괄호 문제](https://school.programmers.co.kr/learn/courses/30/lessons/12909)가 똑같이 있길래 풀어봤습니다 근데 효율성 테스트에서 TimeOut이 나서 해당 로직을 점검하는 중에

Swift의 `append`가 동적 배열인 경우 시간 복잡도가 O(N)까지 증가할 수 있다라는 사실을 알게 되었습니다

왜 시간 복잡도가 증가하는지 스위프트 레포지토리에 [Array](https://github.com/swiftlang/swift/blob/d5b4a178f02eaf9ef4a95f506962ba613948d932/stdlib/public/core/Array.swift#L1181)를 찾아보게 되었습니다.

동적 배열에서 새로운 요소를 append할 때 배열을 복사해서 재할당하면서 배열의 길이만큼 복잡도가 증가한다고 합니다. 결국 크기가 큰 배열에 append를 한다면 효율성이 떨어질 수 밖에 없습니다.

그래서 하나는 스택을 직접 구현하는 방법이 있습니다.

```swift
class StackNode<T> {
    var value: T
    var next: StackNode?

    init(value: T) {
        self.value = value
    }
}

class Stack<T> {
    private var top: StackNode<T>?

    func push(_ value: T) {
        let newNode = StackNode(value: value)
        newNode.next = top  
        top = newNode
    }

    func pop() -> T? {
        guard let currentTop = top else { return nil }
        top = currentTop.next
        return currentTop.value
    }

    func peek() -> T? {
        return top?.value
    }

    func isEmpty() -> Bool {
        return top == nil
    }
}
```
<br>

두번째 방법은 사실 스택을 사용하지 않는 것 입니다.

```swift
func solution(_ s:String) -> Bool
{
    var stack = 0
    
    for char in s {
        if char == "(" {
            count += 1
        } else { 
            guard count > 0 else { return false }
            count -= 1
        }
    }
    
    return count == 0
}
```

<br>

## 스택 수열
