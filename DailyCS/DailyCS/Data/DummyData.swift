//
//  DummyData.swift
//  DailyCS
//
//  Created by home on 7/4/25.
//

import Foundation

struct DummyQuestionData: Codable {
    let id: Int
    let level: Int
    let questionText: String
    let answerList: [String]
    let answerNumber: Int
}


let questionDummyDatas: [QuestionData] = [
  
    QuestionData(
        id: 1,
        level: 1,
        question: "컴퓨터에서 1바이트(Byte)는 몇 비트(Bit)로 구성되어 있을까요?",
        answer_number: 1,
        answer1: "4비트",
        answer2: "8비트",
        answer3: "16비트",
        answer4: "32비트"
    ),
    QuestionData(
        id: 2,
        level: 1,
        question: "다음 중 컴퓨터의 기본적인 3대 구성 요소가 아닌 것은?",
        answer_number: 3,
        answer1: "입력 장치",
        answer2: "중앙처리장치",
        answer3: "출력 장치",
        answer4: "배터리"
    ),
    QuestionData(
        id: 3,
        level: 1,
        question: "다음 중 대표적인 운영체제가 아닌 것은?",
        answer_number: 3,
        answer1: "Windows",
        answer2: "Linux",
        answer3: "macOS",
        answer4: "Oracle"
    ),
    QuestionData(
        id: 4,
        level: 2,
        question: "스택(Stack)의 가장 큰 특징은 무엇인가요?",
        answer_number: 1,
        answer1: "FIFO",
        answer2: "LIFO",
        answer3: "무작위 접근",
        answer4: "순차 접근"
    ),
    QuestionData(
        id: 5,
        level: 2,
        question: "HTTP 상태 코드 404는 어떤 의미인가요?",
        answer_number: 2,
        answer1: "성공",
        answer2: "서버 오류",
        answer3: "페이지를 찾을 수 없음",
        answer4: "권한 없음"
    ),
    QuestionData(
        id: 6,
        level: 2,
        question: "CPU가 명령어를 실행하는 주기를 무엇이라고 하나요?",
        answer_number: 0,
        answer1: "Fetch-Execute Cycle",
        answer2: "Bitwise Cycle",
        answer3: "Clock Cycle",
        answer4: "Task Cycle"
    ),
    QuestionData(
        id: 7,
        level: 3,
        question: "데이터베이스 정규화의 목적 중 올바르지 않은 것은?",
        answer_number: 2,
        answer1: "데이터 중복 제거",
        answer2: "데이터 무결성 향상",
        answer3: "쿼리 속도 저하",
        answer4: "데이터 구조 체계화"
    ),
    QuestionData(
        id: 8,
        level: 3,
        question: "IPv4 주소 체계에서 클래스 C의 기본 서브넷 마스크는?",
        answer_number: 2,
        answer1: "255.0.0.0",
        answer2: "255.255.0.0",
        answer3: "255.255.255.0",
        answer4: "255.255.255.255"
    ),
    QuestionData(
        id: 9,
        level: 3,
        question: "운영체제에서 교착 상태(Deadlock)가 발생하는 필수 조건이 아닌 것은?",
        answer_number: 2,
        answer1: "상호 배제",
        answer2: "점유와 대기",
        answer3: "선점 가능",
        answer4: "순환 대기"
    ),
    QuestionData(
        id: 10,
        level: 2,
        question: "빅오(Big-O) 표기법에서 이진 탐색(Binary Search)의 시간 복잡도는?",
        answer_number: 2,
        answer1: "O(1)",
        answer2: "O(n)",
        answer3: "O(log n)",
        answer4: "O(n log n)"
    )
]
