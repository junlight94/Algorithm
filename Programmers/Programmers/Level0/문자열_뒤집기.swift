//
//  문자열_뒤집기.swift
//  Programmers
//
//  Created by Junyoung Lee on 4/18/25.
//

import Foundation

/*
 문제 설명
 문자열 my_string과 정수 s, e가 매개변수로 주어질 때, my_string에서 인덱스 s부터 인덱스 e까지를 뒤집은 문자열을 return 하는 solution 함수를 작성해 주세요.

 제한사항
 my_string은 숫자와 알파벳으로만 이루어져 있습니다.
 1 ≤ my_string의 길이 ≤ 1,000
 0 ≤ s ≤ e < my_string의 길이
 
 입출력 예
 my_string              s               e               result
 "Progra21Sremm3"       6               12              "ProgrammerS123"
 "Stanley1yelnatS"      4               10              "Stanley1yelnatS"
 */

func solution_string_reverse(_ my_string:String, _ s:Int, _ e:Int) -> String {
    // 문자열을 배열로 Mapping
    var my_string = my_string.map { String($0) }
    // start와 end 부분을 잘라서 뒤집기
    let reversedString = Array(my_string[s...e].reversed())
    
    var index = 0
    
    // start...end 까지 반복하면서 뒤집힌 값 insert
    for i in s...e {
        my_string[i] = reversedString[index]
        index += 1
    }
    
    // 배열을 String으로
    return my_string.joined()
}

func solution_string_reverse2(_ my_string:String, _ s:Int, _ e:Int) -> String {
    // Array로 감싸면 map 한 결과 와 같지만 element가 String / String.Element(Char)로 차이가 있음
    var my_string = Array(my_string)
    let reversedString = Array(my_string[s...e].reversed())
    
    // 배열에서 바꾸고 싶은 범위를 정하고 새로운 배열로 범위를 대체하는 함수
    my_string.replaceSubrange(s...e, with: reversedString)
    
    return String(my_string)
}
