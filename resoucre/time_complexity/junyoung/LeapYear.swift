import Foundation

var input = readLine()

if let input = Int(input ?? "0") {
    print(solution(input))
}

func solution(_ year: Int) -> Int {
    if year % 4 == 0 && (year % 100 != 0 || year % 400 == 0) {
        return 1
    } else {
        return 0
    }
}
