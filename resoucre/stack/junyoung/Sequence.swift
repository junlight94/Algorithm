if let inputCount = Int(readLine()!) {
    
    var numbers = [Int]()
    var stack = [Int]()
    var resultStack = [String]()
    
    for _ in 0..<inputCount {
        if let input = readLine(), let number = Int(input) {
            numbers.append(number)
        }
    }
    
    var cursor = 0
    
    for i in 1...inputCount {
        stack.append(i)
        resultStack.append("+")
        
        while !stack.isEmpty && numbers[cursor] == stack.last {
            cursor += 1
            stack.removeLast()
            resultStack.append("-")
        }
    }
    
    print(
        stack.isEmpty 
        ? resultStack.map { String($0) }.joined(separator: "\n")
        : "NO"
    )
}
