//
//  염색체.swift
//  BaekJoonTest
//
//  Created by 김민준 on 11/13/23.
//

import Foundation

func 염색체() {

    /// 테스트 케이스의 개수
    let T = Int(readLine()!)!

    /// 염색체 조합
    var chromosome = ""
    let testSet = ["A", "B", "C", "D", "E", "F"]
    let infected = "Infected!"
    let good = "Good"

    /// 최종 값 배열
    var answer: [String] = []

    /// 테스트 케이스 개수 만큼 입력값 받기
    for _ in 1...T {
        let input = readLine()!
        chromosome = input
        checkChromosome()
    }

    /// 염색체 체크 메서드
    func checkChromosome() {
        
        /// 첫번째 조건: A, B, C, D, E, F 중 0개 또는 1개로 시작해야 한다.
        guard testSet.contains(String(chromosome.first!)) else {
            print("첫번째 조건 실패")
            answer.append(good)
            return
        }
        
        if chromosome.first != "A" { chromosome.removeFirst() }
        
        /// 두번째 조건: 그 다음에 A가 하나 또는 그 이상 있어야 한다.
        guard oneOrMore(for: "A") else {
            print("두번째 조건 실패")
            answer.append(good)
            return
        }
        
        /// 세번째 조건: 그 다음에 B가 하나 또는 그 이상 있어야 한다.
        guard oneOrMore(for: "F") else {
            print("세번째 조건 실패")
            answer.append(good)
            return
        }
        
        /// 네번째 조건: 그 다음에 C가 하나 또는 그 이상 있어야 한다.
        guard oneOrMore(for: "C") else {
            print("네번째 조건 실패")
            answer.append(good)
            return
        }
        
        /// 다섯번째 조건: A, B, C, D, E, F 중0개 또는 1개가 있으며, 더 이상의 문자는 없어야 한다.
        for char in chromosome {
            guard testSet.contains(String(char)) else {
                print("다섯번째 조건 실패")
                answer.append(good)
                return
            }
        }
        
        /// 모든 검사통과 시, 감염 추가
        answer.append(infected)
    }
    
    /// 최종값 출력
    answer.forEach { print($0) }

    /// 하나 또는 그 이상 있어야 하는 조건 체크 함수
    func oneOrMore(for targetCharacter: Character) -> Bool {
        
        /// 조건을 만족하는지 여부
        var isSatisfy = false
        
        for char in chromosome {
            
            /// 일치한다면, 첫번째 문자를 삭제 후 만족하는 것으로 설정
            if char == targetCharacter {
                chromosome.removeFirst()
                isSatisfy = true
            }
            
            /// 일치하지 않는다면 반복문 종료
            else { break }
        }
        
        /// 최종 조건 반환
        return isSatisfy
    }
}
