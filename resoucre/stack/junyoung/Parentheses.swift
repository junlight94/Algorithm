import Foundation

let numberOfInputs = Int(readLine()!)!
var results = [String]()

for _ in 0..<numberOfInputs {
    
    if let input = readLine() {
        results.append(solution(input))
    }
}

print(results.map { String($0)}.joined(separator: "\n"))

func solution(_ result: String) -> String {
    var stack = [String]()
    
    for char in result {
        if char == "(" {
            stack.append(String(char))
        } else {
            guard !stack.isEmpty else { return "NO" }
            stack.removeLast()
        }
    }
    
    return stack.isEmpty ? "YES" : "NO"
}
