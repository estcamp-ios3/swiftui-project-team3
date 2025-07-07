//
//  QuestionData.swift
//  DailyCS
//
//  Created by 송서윤 on 7/4/25.
//

import Foundation

struct QuestionData: Codable {
  let id: Int
  let level: Int
  let question: String
  let answer_number: Int
  let answer1: String
  let answer2: String
  let answer3: String
  let answer4: String
  
    func answers(index: Int) -> String
    {
        switch index {
        case 1:
            return answer1
        case 2:
            return answer2
        case 3:
            return answer3
        case 4:
            return answer4
        default:
            return "wrong number"
        }
    }
}
