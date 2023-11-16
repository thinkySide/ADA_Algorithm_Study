//
//  베스트셀러.swift
//  BaekJoonTest
//
//  Created by 김민준 on 11/13/23.
//

import Foundation

func 베스트셀러() {
    
    /// 입력 횟수
    let N = Int(readLine()!)!

    /// Dictionary 형태로 값 받기
    var list: [String : Int] = [:]

    /// 횟수 만큼 입력 받기
    for _ in 1...N {
        let input = readLine()!
        
        /// 이미 키를 가지고 있다면 기존 value + 1
        if list.contains(where: { $0.key == input }) {
            list[input]! += 1
        }
        
        /// 새로운 키가 들어왔다면 추가
        else { list.updateValue(1, forKey: input) }
    }

    /// 가장 많이 나온 값만 모은 후
    let maxValue = list.max { $0.value < $1.value }!.value

    /// 많이 나온 값만 필터
    let filter = list.filter { $0.value == maxValue }

    /// 이후 최종 출력
    if filter.count == 1 { print(filter.first!.key) }
    else { print(filter.sorted { $0.key < $1.key }.first!.key) }
}
