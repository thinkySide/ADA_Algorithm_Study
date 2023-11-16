//
//  듣보잡.swift
//  BaekJoonTest
//
//  Created by 김민준 on 11/11/23.
//

import Foundation

func 듣보잡() {
    
    /// 입력 값 받기
    let input = readLine()!.split(separator: " ")
    let N = Int(input[0])!
    let M = Int(input[1])!

    /// 최종 값을 담을 배열
    var noHear = Set<String>()
    var noSee = Set<String>()

    /// 듣도못한 사람 수만큼 입력 받기
    for _ in 0..<N {
        let name = readLine()!
        noHear.insert(name)
    }

    /// 보도못한 사람 수만큼 입력 받기
    for _ in 0..<M {
        let name = readLine()!
        noSee.insert(name)
    }

    /// 교집합을 통해 듣보잡 이름 구하기
    let intersection = noHear.intersection(noSee)
    print(intersection.count)
    intersection.sorted().forEach { print($0) }
}

func 듣보잡_시간초과() {
    
    /// 입력 값 받기
    let input = readLine()!.split(separator: " ")
    let N = Int(input[0])!
    let M = Int(input[1])!

    /// 최종 값을 담을 배열
    var check: [String] = []
    var answer: [String] = []

    /// 듣도못한 사람 수만큼 입력 받기
    for _ in 0..<N {
        let name = readLine()!
        check.append(name)
    }

    /// 보도못한 사람 수만큼 입력 받기
    for _ in 0..<M {
        let name = readLine()!
        if check.contains(name) { answer.append(name) }
    }

    /// 최종값 출력
    print(answer.count)
    answer.forEach { print($0) }
}
