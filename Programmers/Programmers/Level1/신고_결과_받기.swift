//
//  신고_결과_받기.swift
//  Programmers
//
//  Created by Junyoung Lee on 4/21/25.
//

import Foundation

/*
 https://school.programmers.co.kr/learn/courses/30/lessons/92334
 */

func solution_report(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    // 신고자와 신고한 사람 리스트
    var reporters: [String: [String]] = [:]
    // 신고 당한 사람 리스트
    var reportedUsers: [String: Int] = [:]
    
    // 중복 신고 제거한 반복
    for reportContent in Set(report) {
        let split = reportContent.split(separator: " ")
        let reporter = String(split[0])
        let reportedUser = String(split[1])
        
        // [신고자: 신고한 사람]
        reporters[reporter, default: []].append(reportedUser)
        // [신고 당한 사람: 횟수]
        reportedUsers[reportedUser, default: 0] += 1
    }
    
    print(reporters)
    print(reportedUsers)
    
    // id_list 순으로 정렬된 값을 리턴하기 때문에 map
    return id_list.map { id in
        // 신고자의 신고 목록 필터링
        (reporters[id] ?? []).filter {
            // 신고 당한 사람 이 해당 신고자 목록에 포함 되며 신고 횟수가 k를 넘어가는 경우
            (reportedUsers[$0] ?? 0) >= k
        }.count
    }
}
