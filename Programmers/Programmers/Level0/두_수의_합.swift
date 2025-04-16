//
//  두_수의_합.swift
//  Programmers
//
//  Created by Junyoung on 4/17/25.
//

import Foundation

/*
 문제 설명
 0 이상의 두 정수가 문자열 a, b로 주어질 때, a + b의 값을 문자열로 return 하는 solution 함수를 작성해 주세요.
 
 제한사항
 1 ≤ a의 길이 ≤ 100,000
 1 ≤ b의 길이 ≤ 100,000
 a와 b는 숫자로만 이루어져 있습니다.
 a와 b는 정수 0이 아니라면 0으로 시작하지 않습니다.
 
 입출력 예
 a                          b                           result
 "582"                      "734"                       "1316"
 "18446744073709551615"     "287346502836570928366"     "305793246910280479981"
 "0"                        "0"                         "0"
 
 풀이
 Int로 간단하게 안되는 이유는 Int64가 표현할 수 있는 20자리를 넘어감
 결국 더하기를 직접 구현해서 풀어야됨 + 시간 복잡도 배열 더블링 때문에 미리 결과 배열 길이 생성하고 시작
 */

func solution(_ a:String, _ b:String) -> String {
    // a를 뒤집은 변수
    let aChar = Array(a.reversed())
    
    // b를 뒤집은 변수
    let bChar = Array(b.reversed())
    
    // a와 b중에 더 긴 숫자 Count (큰 수로 반복문 돌리기 때문에)
    let maxLength = max(aChar.count, bChar.count)
    
    // 결과를 받는 배열 (배열 append에서 더블링 이슈로 미리 최대크기 생성)
    var result = Array(repeating: "", count: 100000)
    
    // 올림
    var carry: Int = 0
    
    for i in 0..<maxLength {
        // i보다 개수가 적을때 i번째 숫자를 뽑아내는 변수
        let digitA = i < aChar.count ? Int(String(aChar[i]))! : 0
        let digitB = i < bChar.count ? Int(String(bChar[i]))! : 0
        
        // a + b + 올림
        let sum = digitA + digitB + carry
        carry = sum / 10
        result.append(String(sum % 10))
    }
    
    if carry > 0 {
        result.append(String(carry))
    }
    
    return result.reversed().joined()
}
