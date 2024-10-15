
let n = Int(readLine()!)!
var current = 1
var stack = [Int]()
var answer = [String]()
var isFail = false

for _ in 1...n {
    let num = Int(readLine()!)!
    
    while num >= current {
        stack.append(current)
        answer.append("+")
        current += 1
    }
    
    if stack.last == num {
        stack.removeLast()
        answer.append("-")
    } else {
        isFail = true
        break
    }
}

guard !isFail else {
  print("NO")  
  return
}
for i in answer {
  print(i)
}

