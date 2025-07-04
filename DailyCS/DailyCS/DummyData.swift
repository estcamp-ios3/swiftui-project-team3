//
//  DummyData.swift
//  DailyCS
//
//  Created by home on 7/4/25.
//

import Foundation

let csQuestions: [QuestionData] = [

  QuestionData(
    id: 1,
    level: 1,
    questionText: "컴퓨터에서 1바이트(Byte)는 몇 비트(Bit)로 구성되어 있을까요?",
    answerList: ["4비트", "8비트", "16비트", "32비트"],
    answerNumber: 1
  ),

  QuestionData(
    id: 2,
    level: 1,
    questionText: "다음 중 컴퓨터의 기본적인 3대 구성 요소가 아닌 것은?",
    answerList: ["입력 장치", "중앙처리장치", "출력 장치", "배터리"],
    answerNumber: 3
  ),

  QuestionData(
    id: 3,
    level: 1,
    questionText: "다음 중 대표적인 운영체제가 아닌 것은?",
    answerList: ["Windows", "Linux", "macOS", "Oracle"],
    answerNumber: 3
  ),

  QuestionData(
    id: 4,
    level: 2,
    questionText: "스택(Stack)의 가장 큰 특징은 무엇인가요?",
    answerList: ["FIFO", "LIFO", "무작위 접근", "순차 접근"],
    answerNumber: 1
  ),

  QuestionData(
    id: 5,
    level: 2,
    questionText: "HTTP 상태 코드 404는 어떤 의미인가요?",
    answerList: ["성공", "서버 오류", "페이지를 찾을 수 없음", "권한 없음"],
    answerNumber: 2
  ),

  QuestionData(
    id: 6,
    level: 2,
    questionText: "CPU가 명령어를 실행하는 주기를 무엇이라고 하나요?",
    answerList: ["Fetch-Execute Cycle", "Bitwise Cycle", "Clock Cycle", "Task Cycle"],
    answerNumber: 0
  ),

  QuestionData(
    id: 7,
    level: 3,
    questionText: "데이터베이스 정규화의 목적 중 올바르지 않은 것은?",
    answerList: ["데이터 중복 제거", "데이터 무결성 향상", "쿼리 속도 저하", "데이터 구조 체계화"],
    answerNumber: 2
  ),

  QuestionData(
    id: 8,
    level: 3,
    questionText: "IPv4 주소 체계에서 클래스 C의 기본 서브넷 마스크는?",
    answerList: ["255.0.0.0", "255.255.0.0", "255.255.255.0", "255.255.255.255"],
    answerNumber: 2
  ),

  QuestionData(
    id: 9,
    level: 3,
    questionText: "운영체제에서 교착 상태(Deadlock)가 발생하는 필수 조건이 아닌 것은?",
    answerList: ["상호 배제", "점유와 대기", "선점 가능", "순환 대기"],
    answerNumber: 2
  ),

  QuestionData(
    id: 10,
    level: 2,
    questionText: "빅오(Big-O) 표기법에서 이진 탐색(Binary Search)의 시간 복잡도는?",
    answerList: ["O(1)", "O(n)", "O(log n)", "O(n log n)"],
    answerNumber: 2
  )
]
