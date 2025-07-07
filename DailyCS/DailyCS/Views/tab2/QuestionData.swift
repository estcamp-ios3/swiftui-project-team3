//
//  QuestionData.swift
//  DailyCS
//
//  Created by 송서윤 on 7/4/25.
//

import Foundation



struct QuestionData: Identifiable {
    let id: Int
    let level: Int
    let questionText: String
    let answerList: [String]
    let answerNumber: Int
}


var questions: [QuestionData] = [
    QuestionData(id: 1, level: 1, questionText: "swift는 ~", answerList: ["1", "2", "3", "4"], answerNumber: 0),
    QuestionData(id: 2, level: 1, questionText: "swift2는 ~", answerList: ["1", "2", "3", "4"], answerNumber: 1),
    QuestionData(id: 3, level: 3, questionText: "swift3는 ~", answerList: ["1", "2", "3", "4"], answerNumber: 2),
    QuestionData(id: 4, level: 2, questionText: "swift4는 ~", answerList: ["1", "2", "3", "4"], answerNumber: 3),
    QuestionData(id: 5, level: 4, questionText: "swift5는 ~", answerList: ["1", "2", "3", "4"], answerNumber: 3),
    QuestionData(id: 6, level: 5, questionText: "swift6는 ~", answerList: ["1", "2", "3", "4"], answerNumber: 3),
    QuestionData(id: 7, level: 4, questionText: "swift7는 ~", answerList: ["1", "2", "3", "4"], answerNumber: 3),
    QuestionData(id: 8, level: 5, questionText: "swift8는 ~", answerList: ["1", "2", "3", "4"], answerNumber: 3),

        
]

