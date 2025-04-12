//
//  정사각형으로 만들기.swift
//  Programmers
//
//  Created by Junyoung on 4/12/25.
//

import Foundation

func solution(_ arr:[[Int]]) -> [[Int]] {
    var resultArr = arr
    // 행의 개수
    let rowCount = arr.count
    // 열의 개수
    let colCount = arr[0].count
    
    // 열을 더해서 정사각형으로 만들 때 필요한 개수 = 열의 개수 - 행의 개수
    let isAddRow = colCount - rowCount
    // 행을 더해서 정사각형으로 만들 때 필요한 개수 = 행의 개수 - 열의 개수
    let isAddCol = rowCount - colCount
    
    // (더해야 되는)행이나 열이 0 이면 정사각형 임으로 earlyReturn
    guard isAddRow != 0, isAddCol != 0 else {
        return arr
    }
    
    // 열 추가
    if isAddRow > 0 {
        for _ in 0..<isAddRow {
            let newArray = Array(repeating: 0, count: colCount)
            resultArr.append(newArray)
        }
    }
    
    // 행 추가
    if isAddCol > 0 {
        for i in 0..<resultArr.count {
            resultArr[i] = resultArr[i] + Array(repeating: 0, count: isAddCol)
        }
    }
    
    return resultArr
}
