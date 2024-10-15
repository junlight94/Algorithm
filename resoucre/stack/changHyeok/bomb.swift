import Foundation

var input = String(readLine()!)
let bomb = String(readLine()!)

var stack: [Character] = []

for i in input {
    stack.append(i)
    
    if i == bomb.last! {
        let count = stack.count
        
        if count >= bomb.count && String(stack[(count-bomb.count)...]) == bomb {
            (0..<bomb.count).forEach { _ in
                stack.popLast()
            }
        }
    }
}

print(stack.isEmpty ? "FRULA" : String(stack))
