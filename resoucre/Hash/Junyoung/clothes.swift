import Foundation

func solution(_ clothes:[[String]]) -> Int {
    
    var categoryCount: [String: Int] = [:]
    
    clothes.forEach { cloth in
        let category = cloth[1]
        categoryCount[category, default: 0] += 1
    }
    
    var combinations = 1
    for count in categoryCount.values {
        combinations *= (count + 1)
    }
    
    return combinations - 1
}
