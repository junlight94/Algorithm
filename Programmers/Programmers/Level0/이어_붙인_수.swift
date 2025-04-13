//
//  이어_붙인_수.swift
//  Programmers
//
//  Created by Junyoung on 4/13/25.
//

import Foundation
/*
 문제 설명
 정수가 담긴 리스트 num_list가 주어집니다. num_list의 홀수만 순서대로 이어 붙인 수와 짝수만 순서대로 이어 붙인 수의 합을 return하도록 solution 함수를 완성해주세요.

 제한사항
 2 ≤ num_list의 길이 ≤ 10
 1 ≤ num_list의 원소 ≤ 9
 num_list에는 적어도 한 개씩의 짝수와 홀수가 있습니다.
 */

func solution(_ num_list:[Int]) -> Int {
    let odd = Int(num_list.filter { $0 % 2 != 0 }.map { String($0) }.joined()) ?? 0
    let even = Int(num_list.filter { $0 % 2 == 0 }.map { String($0) }.joined()) ?? 0
    let result = odd + even
    
    return result
}
