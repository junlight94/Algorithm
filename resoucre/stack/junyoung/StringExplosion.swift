let firstLine = readLine()!
let secondLine = readLine()!

print(solution(first: firstLine, second: secondLine))

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
