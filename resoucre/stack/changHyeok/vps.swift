import Foundation

let inputStringCount = Int(readLine()!)!
var result: [String] = []

func isVPS(input: String) -> String {
    
    var stack: [String] = []
    
    for char in input {
        let str = String(char)
        if str == "(" {
            stack.append(str)
        } else {
            guard !stack.isEmpty else {
                return "NO"
            }
            stack.removeLast()
        }
    }
    return stack.isEmpty ? "YES" : "NO"
}

for _ in 1...inputStringCount {
    result.append(isVPS(input: readLine()!))
}

for i in result {
    print(i)
}
