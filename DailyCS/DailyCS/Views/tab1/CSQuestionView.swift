//
//  CSQuestionView.swift
//  DailyCS
//
//  Created by home on 7/4/25.
//

import SwiftUI


struct CSQuestionView: View {
  
  var difficultyLevel: Int = 1
  
    var questionData = questionDummyDatas.shuffled().prefix(5)
    
  var body: some View {
    VStack {
      
      VStack(alignment: .leading) {
        
        Text(questionDummyDatas[0].question)
          .font(.headline)
        
        List {
            Text("1. " + questionDummyDatas[0].answers(index: 1))
            Text("2. " + questionDummyDatas[0].answers(index: 2))
            Text("3. " + questionDummyDatas[0].answers(index: 3))
            Text("4. " + questionDummyDatas[0].answers(index: 4))
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

  
  #Preview {
    CSQuestionView()
  }
