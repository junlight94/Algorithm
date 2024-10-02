import UIKit

// 과제 28명 제출
// 제출 안한 학생 2명의 출력 번호

var numbers: [Int] = []

for _ in 0..<28 {
    let value = Int(readLine()!)!
    numbers.append(value)
}

(1...30).filter { !numbers.contains($0) }.forEach { print($0) }

// 입 / 출력을 제외한 시간복잡도는 O(n) 입니다
