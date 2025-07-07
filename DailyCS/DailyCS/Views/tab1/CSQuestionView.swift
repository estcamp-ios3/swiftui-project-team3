//
//  CSQuestionView.swift
//  DailyCS
//
//  Created by home on 7/4/25.
//

import SwiftUI


struct CSQuestionView: View {
  @Environment(\.modelContext) private var modelContext

  var difficultyLevel: Int = 1
  
  var questionData: DummyQuestionData = DummyQuestionData(id: 1, level: 1, questionText: "문제 내용", answerList: ["a", "b", "c", "d"], answerNumber: 1)
  
  var body: some View {
    VStack {
      
      VStack(alignment: .leading) {
        
        Text(questionData.questionText)
          .font(.headline)
        
        List(questionData.answerList, id: \.self) { item in
          
          Button(item){
            
          }
          
        }
        
      }.padding(30)
      
      NavigationLink(destination:CSQuestionView()) {
        Text("다음 문제")
          .frame(width: 200, height: 50)
          .background(Color.mainGreen)
          .foregroundColor(.white)
          .cornerRadius(20)
      }
    }
  }
  
  /// 질문 로컬에 저장하기
  func saveQuestion(question: QuestionData){
    let saveQeustion = QuestionDataForSave(with: question)
    
    modelContext.insert(saveQeustion)
  }
}
  
  #Preview {
    CSQuestionView()
  }
