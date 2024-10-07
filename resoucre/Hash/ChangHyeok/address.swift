import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }

let (addressCount, findPasswordCount) = (input[0], input[1])

var table: [String: String] = [:]

for _ in 0..<addressCount {
    let input = readLine()!.split(separator: " ").map { String($0) }
    let siteAddress = input[0]
    let password = input[1]
    
    table[siteAddress] = password
    
}

for _ in 0..<findPasswordCount {
    let addressName = readLine()!
    print(table[addressName]!)
}
