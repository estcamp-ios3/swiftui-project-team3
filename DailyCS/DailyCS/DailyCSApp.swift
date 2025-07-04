//
//  DailyCSApp.swift
//  DailyCS
//
//  Created by 최용헌 on 7/4/25.
//

import SwiftUI

@main
struct DailyCSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
  
  let data: [QuestionData] = [
    QuestionData(id: 1, level: 2, question: "test", answerList: ["1","2"], answerNumber: 1)
    
  ]
  
}


/// 문제 데이터 구조
struct QuestionData {
  let id: Int
  let level: Int
  let question: String
  let answerList: [String]
  let answerNumber: Int
}

