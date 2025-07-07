//
//  SavedQuestionDetailView.swift
//  DailyCS
//
//  Created by 송서윤 on 7/4/25.
//

import SwiftUI

struct SavedQuestionDetailView: View {
  
  let question: QuestionData
  @State private var showAnswer = false
  
  var body: some View {
    
    VStack {
      
      Text(question.question)
        .font(.title)
        .bold()
        .padding()
      if !showAnswer {
        Button("정답보기") {
          withAnimation {
            showAnswer = true
          }
        }
        .font(.title2)
        .buttonStyle(.borderedProminent)
        .tint(.green)
      } else {
        Text("\(question.answer1)")
          .font(.title2)
      }
    }
  }
}



#Preview {
  NavigationStack {
    SavedQuestionDetailView(question: QuestionData(id: 1, level: 1, question: "test", answer_number: 1, answer1: "test", answer2: "test", answer3: "test", answer4: "test") )
  }
}
