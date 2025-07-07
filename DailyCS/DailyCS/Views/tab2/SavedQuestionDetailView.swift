////
////  SavedQuestionDetailView.swift
////  DailyCS
////
////  Created by 송서윤 on 7/4/25.
////
//
//import SwiftUI
//
//struct SavedQuestionDetailView: View {
//  
//  let question: QuestionData
//  @State private var showAnswer = false
//  
//  var body: some View {
//    
//    VStack {
//      
//      Text(question.questionText)
//        .font(.title)
//        .bold()
//        .padding()
//      if !showAnswer {
//        Button("정답보기") {
//          withAnimation {
//            showAnswer = true
//          }
//        }
//        .font(.title2)
//        .buttonStyle(.borderedProminent)
//        .tint(.green)
//      } else {
//        Text("\(question.answerList[question.answerNumber])")
//          .font(.title2)
//      }
//    }
//  }
//}
//
//
//
//#Preview {
//  NavigationStack {
//    SavedQuestionDetailView(question: questions[0])
//  }
//}
