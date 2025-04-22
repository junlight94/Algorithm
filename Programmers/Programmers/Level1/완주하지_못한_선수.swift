//
//  완주하지_못한_선수.swift
//  Programmers
//
//  Created by Junyoung Lee on 4/22/25.
//

import Foundation
/*
 문제 설명
 수많은 마라톤 선수들이 마라톤에 참여하였습니다. 단 한 명의 선수를 제외하고는 모든 선수가 마라톤을 완주하였습니다.

 마라톤에 참여한 선수들의 이름이 담긴 배열 participant와 완주한 선수들의 이름이 담긴 배열 completion이 주어질 때, 완주하지 못한 선수의 이름을 return 하도록 solution 함수를 작성해주세요.

 제한사항
 마라톤 경기에 참여한 선수의 수는 1명 이상 100,000명 이하입니다.
 completion의 길이는 participant의 길이보다 1 작습니다.
 참가자의 이름은 1개 이상 20개 이하의 알파벳 소문자로 이루어져 있습니다.
 참가자 중에는 동명이인이 있을 수 있습니다.
 
 입출력 예
 participant                                            completion                                  return
 ["leo", "kiki", "eden"]                                ["eden", "kiki"]                            "leo"
 ["marina", "josipa", "nikola", "vinko", "filipa"]      ["josipa", "filipa", "marina", "nikola"]    "vinko"
 ["mislav", "stanko", "mislav", "ana"]                  ["stanko", "ana", "mislav"]                 "mislav"
 */

// 제한 사항으로 인해서 n^2인 이중 반복문을 사용할 수 없음
// 3n으로 풀이
func solution_participant(_ participant: [String], _ completion: [String]) -> String {
    var result: [String: Int] = [:]
    
    // 선수 목록 등록 + 1
    participant.forEach { participant in
        result[participant, default: 0] += 1
    }
    
    // 완주한 선수 등록 + 1
    completion.forEach { completion in
        result[completion, default: 0] += 1
    }
    
    // 완주한 선수: 2, 완주하지 못한 선수: 1 필터링
    return result.first(where: { $0.value == 1 } )!.key
}
