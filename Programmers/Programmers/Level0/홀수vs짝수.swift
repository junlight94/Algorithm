//
//  홀수vs짝수.swift
//  Programmers
//
//  Created by Junyoung on 4/17/25.
//

import Foundation
/*
 문제 설명
 정수 리스트 num_list가 주어집니다. 가장 첫 번째 원소를 1번 원소라고 할 때, 홀수 번째 원소들의 합과 짝수 번째 원소들의 합 중 큰 값을 return
 하도록 solution 함수를 완성해주세요. 두 값이 같을 경우 그 값을 return합니다.

 제한사항
 5 ≤ num_list의 길이 ≤ 50
 -9 ≤ num_list의 원소 ≤ 9
 
 입출력 예
 num_list               result
 [4, 2, 6, 1, 7, 6]     17
 [-1, 2, 5, 6, 3]       8
 
 *
 enumerated()
 배열을 순회하면서 값과 인덱스를 같이 받기 위한 함수
 enumerated()는 내부적으로 (offset: Int, element: Element) 형식의 튜플을 반환
 
 ex) let fruits = ["🍎", "🍌", "🍇"]
 (offset: 0, element: "🍎")
 (offset: 1, element: "🍌")
 (offset: 2, element: "🍇")
 
 */
func solution_odd_vs_even(_ num_list:[Int]) -> Int {
    let odd = num_list.enumerated().filter { $0.offset % 2 != 0 }.map { $0.element }.reduce(0, +)
    let even = num_list.enumerated().filter { $0.offset % 2 == 0 }.map { $0.element }.reduce(0, +)
    
    return odd > even ? odd : even
}
