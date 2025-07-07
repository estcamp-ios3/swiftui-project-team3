//
//  CSQuestionView.swift
//  DailyCS
//
//  Created by home on 7/4/25.
//

import SwiftUI




struct CSQuestionView: View {
    
    @State var yourAnswer: Int = 0
    @State var ChosenQuestion: Int = 0
    var questionDatas = questionDummyDatas.shuffled().prefix(5)
    var difficultyLevel: Int = 1
    
    
  var body: some View {
    VStack {
      
      VStack(alignment: .leading) {
        
        Text(questionDatas[ChosenQuestion].question)
          .font(.headline)
        
        List {
            
            Button(action: {yourAnswer = 1}
                ) {
                Text("1. " + questionDatas[ChosenQuestion].answers(index: 1))
            }
            
            Button(action: {yourAnswer = 2}
            ) {
                Text("2. " + questionDatas[ChosenQuestion].answers(index: 2))
            }
            
            Button(action: {yourAnswer = 3}
            ) {
                Text("3. " + questionDatas[ChosenQuestion].answers(index: 3))
            }
           
            Button(action: {yourAnswer = 4})
            {
                Text("4. " + questionDatas[ChosenQuestion].answers(index: 4))
            }
        }
          if yourAnswer != 0 {
          Text("Your answer: \(yourAnswer). \(questionDatas[ChosenQuestion].answers(index: yourAnswer))")
          }
    }
        
      }.padding(30)
      if ChosenQuestion < questionDatas.count - 1 {
              
          Button(action: {
              ChosenQuestion += 1
          }) {
            Text("다음 문제")
              .frame(width: 200, height: 50)
              .background(Color.mainGreen)
              .foregroundColor(.white)
              .cornerRadius(20)
          }
      }
      else{
          NavigationLink(destination: QuestionResultView()) {
              Text("다 풀었어요~")
          }
      }
    }
  }

  
  #Preview {
    CSQuestionView()
  }
