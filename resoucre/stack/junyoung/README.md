## 괄호
[백준 실버4, 괄호](https://github.com/junlight94/Algorithm/blob/main/resoucre/stack/junyoung/Parentheses.swift)
![스크린샷 2024-10-10 오후 11 53 04](https://github.com/user-attachments/assets/d3a7e5d2-7390-4221-9c8e-b8a54b594edf)

### 문제
![스크린샷 2024-10-12 오후 7 16 45](https://github.com/user-attachments/assets/1767a1af-b0b1-4709-ab16-09ddc6ffaebe)

### 예제
![스크린샷 2024-10-12 오후 7 16 59](https://github.com/user-attachments/assets/a59ce638-cfc1-484f-8d7d-2f9c591f5944)

### 문제 풀이
1. 전체 괄호 String을 반복문을 돌립니다.
2. "(" 여는 괄호를 만나면 스택에 넣습니다.
3. ")" 닫는 괄호를 만나면 스택에 최상단을 pop해서 괄호를 만들어서 버립니다.
4. ")" 닫는 괄호를 만났는데 스택이 비어있으면 early return 으로 "NO"를 찍고 종료합니다.
5. 모든 for문이 돌고나서 스택이 비어있으면 "YES" 아니면 "NO"를 출력합니다.

<br>

### 코드
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
[백준 실버2, 스택 수열](https://github.com/junlight94/Algorithm/blob/main/resoucre/stack/junyoung/Sequence.swift)
![스크린샷 2024-10-10 오후 11 53 04](https://github.com/user-attachments/assets/f7165249-35f7-4509-a876-438fba307814)

### 문제
![스크린샷 2024-10-12 오후 7 17 35](https://github.com/user-attachments/assets/2c6c5f49-b95e-45fc-87dd-f46575794767)

### 예제
![스크린샷 2024-10-12 오후 7 15 17](https://github.com/user-attachments/assets/2c7a7d35-cbbc-4f95-9593-2a83f67443d3)


### 문제 풀이
1. 첫번째 입력에서 들어온 정수의 수만큼 수열을 만듭니다 ex) 8 = `[1, 2, 3, 4, 5, 6, 7, 8]`
2. 이어서 입력으로 들어온 정수들을 또 다른 배열에 넣습니다. `[4, 3, 6, 8, 7, 5, 2, 1]`
3. 빈 스택을 생성합니다. 결과값 연산자를 넣는 빈 배열을 생성합니다.
4. 2번의 배열 인덱스를 추적하기 위한 cursor 변수를 만들고 0으로 초기화 합니다.
5. 1번 배열을 순회하면서 스택에 값을 push하고 결과값을 저장하는 배열에 "+"를 넣습니다.
6. 값을 push한 후에 while문으로 스택의 최상단이 2번 배열 `[cursor]`와 같으면 pop을하고 cursor위치를 증가시킵니다. 아니면 종료합니다.
7. 스택이 비어있다면 결과 배열을 출력하고 비어있지 않다면 "NO"를 출력합니다.

### 코드
``` swift
for i in 1...inputCount {
        stack.append(i)
        resultStack.append("+")

        while !stack.isEmpty && numbers[cursor] == stack.last {
            cursor += 1
            stack.removeLast()
            resultStack.append("-")
        }
}
```

<br>

## 문자열 폭발
[백준 골드4, 문자열 폭발](https://github.com/junlight94/Algorithm/blob/main/resoucre/stack/junyoung/StringExplosion.swift)
![스크린샷 2024-10-13 오전 1 25 54](https://github.com/user-attachments/assets/3f5297bd-7ed9-40ab-916f-8a66b52ad5af)

### 문제
![스크린샷 2024-10-13 오전 1 33 22](https://github.com/user-attachments/assets/37d5778d-c9c9-49d6-b912-d8cac0245a9b)

### 예제
![스크린샷 2024-10-13 오전 1 33 34](https://github.com/user-attachments/assets/843ee5d6-72aa-43fe-88c7-2afb6317af33)

### 문제 풀이
1. 처음에 들어온 일반 문자열의 길이 만큼의 배열 생성 O(N)
2. 문자열의 길이 만큼 반목문 실행 0(N)
3. 스택의 길이와 폭발 문자열 길이가 같거나 크면서 폭발 문자열 길이 만큼 스택의 마지막 부분을 슬라이싱한 값과 폭발 문자열과 일치하면 폭발 문자열의 길이만큼 stack에서 pop
4. 스택이 비었다면 "FRULA"출력 아니라면 스택 출력

### 코드
```swift
func solution(first: String, second: String) -> String {

    // 문자열 첫번째 입련된 최악의 수 만큼의 고정 배열 생성
    var stack = Array<Character>(repeating: " ", count: first.count)
    
    // push, pop을 했을 경우의 인덱스를 조정하는 변수
    var index = 0
    
    let bombLength = second.count
    let bombArray = Array(second)
    
    for char in first {
        stack[index] = char
        index += 1

        // stack의 길이가 폭발 문자열 보다 큰 경우 && 스택의 최상단 부터 폭발 문자열 길이만큼 잘라서 폭발 문자열과 같은지 비교
        if index >= bombLength && stack[index-bombLength..<index].map({$0}) == bombArray {
            // pop과 똑같은 동작 폭발 문자열의 길이 만큼 인덱스 조정(pop)
            // 폭발 문자열 길이 만큼의 pop은 폭발 문자열의 길이에 복잡도 O(N) 이지만, index 위치를 줄이는 것은 O(1) 복잡도
            index -= bombLength
        }
    }
    
    let result = String(stack[0..<index])
    
    return result.isEmpty ? "FRULA" : result
}
```

<br>

## 후위 표기식
[백준 골드2, 후위 표기식]()
