import Foundation

var count = 28
var studentNumber: [Int] = Array(1...30)

for _ in 0..<count {
    if let input = readLine(),
       let num = Int(input) {
        solution(num)
    }
}

func solution(_ number: Int) {
    studentNumber = studentNumber.filter{ $0 != number}
}

print(studentNumber.map { String($0)}.joined(separator: "\n"))
