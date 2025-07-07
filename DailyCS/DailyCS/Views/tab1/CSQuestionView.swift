////
////  CSQuestionView.swift
////  DailyCS
////
////  Created by home on 7/4/25.
////
//
//import SwiftUI
//
//struct CSQuestionView: View {
//  
//  var difficultyLevel: Int = 1
//  
//  var questionData: QuestionData = questionDummyDatas.first!
//  
//  var body: some View {
//    VStack {
//      
//      VStack(alignment: .leading) {
//        
//        Text(questionData.question)
//          .font(.headline)
//        
//        List(questionData.answerList, id: \.self) { item in
//          
//          Button(item){
//            
//          }
//          
//        }
//        
//      }.padding(30)
//      
//      NavigationLink(destination:CSQuestionView()) {
//        Text("다음 문제")
//          .frame(width: 200, height: 50)
//          .background(Color.green)
//          .foregroundColor(.white)
//          .cornerRadius(20)
//      }
//    }
//  }
//}
//
//#Preview {
//  CSQuestionView()
//}
