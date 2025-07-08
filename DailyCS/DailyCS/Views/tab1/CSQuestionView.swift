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
    var difficultyLevel: Int = 1
    
    var questionDatas: [QuestionData] = questionDummyDatas.shuffled()
    
    @State var yourAnswers: [Int] = Array(repeating: 0, count: 5)
    

    var body: some View {
        ZStack
        {
            Color.veryLightGreenBackground.ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text ("난이도 : \(difficultyLevel)")
                        
                        Spacer()
                        
                        Button("문제 저장") {
                            
                        }
                    }.padding(.horizontal)
                    
                    Text(questionDatas[ChosenQuestion].question)
                        .font(.headline)
                    
                    List {
                        
                        Button(action: {
                            yourAnswer = 1
                            yourAnswers[ChosenQuestion] = yourAnswer
                        }
                        ) {
                            Text("1. " + questionDatas[ChosenQuestion].answers(index: 1))
                        }
                        
                        Button(action: {
                            yourAnswer = 2
                            yourAnswers[ChosenQuestion] = yourAnswer
                        }
                        ) {
                            Text("2. " + questionDatas[ChosenQuestion].answers(index: 2))
                        }
                        
                        Button(action: {
                            yourAnswer = 3
                            yourAnswers[ChosenQuestion] = yourAnswer
                        }
                        ) {
                            Text("3. " + questionDatas[ChosenQuestion].answers(index: 3))
                        }
                        
                        Button(action: {
                            yourAnswer = 4
                            yourAnswers[ChosenQuestion] = yourAnswer
                        })
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
                Button(action:{
                    yourAnswer = 0
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
                
                NavigationLink(destination: QuestionResultView(questionDatas: questionDatas, yourAnswers: yourAnswers)) {
                    Text("다 풀었어요~")
                }
            }
        }
    }
}
  
  #Preview {
    CSQuestionView()
  }
