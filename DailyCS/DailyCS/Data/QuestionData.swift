//
//  QuestionData.swift
//  DailyCS
//
//  Created by 송서윤 on 7/4/25.
//

import Foundation
import SwiftData

struct QuestionDataDTO: Codable {
  let id: Int
  let level: Int
  let question: String
  let answer_number: Int
  let answer1: String
  let answer2: String
  let answer3: String
  let answer4: String
  
}

struct QuestionData: Codable, Identifiable {
  var uuid: UUID = UUID()
  let id: Int
  let level: Int
  let question: String
  let answer_number: Int
  let answer1: String
  let answer2: String
  let answer3: String
  let answer4: String  
}
  
struct QuestionData1: Codable, Identifiable {
  var uuid: UUID = UUID()
  let id: Int
  let level: Int
  let question: String
  let answer_number: Int
  let answer1: String
  let answer2: String
  let answer3: String
  let answer4: String
  
  init(with dto: QuestionDataDTO){
    self.id = dto.id
    self.level = dto.level
    self.question = dto.question
    self.answer_number = dto.answer_number
    self.answer1 = dto.answer1
    self.answer2 = dto.answer2
    self.answer3 = dto.answer3
    self.answer4 = dto.answer4
  }
  
}

@Model
class QuestionDataForSave {
  var id: Int
  var level: Int
  var question: String
  var answer: String
  
  init(with data: QuestionData1) {
    self.id = data.id
    self.level = data.level
    self.question = data.question
    self.answer = data.answer1
  }
}
