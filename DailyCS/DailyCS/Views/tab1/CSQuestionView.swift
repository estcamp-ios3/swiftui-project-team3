//
//  CSQuestionView.swift
//  DailyCS
//
//  Created by home on 7/4/25.
//

import SwiftUI




struct CSQuestionView: View {
  @StateObject private var csDataManager = CSDataManager.shared
    @Environment(\.modelContext) private var modelContext
    @State var yourAnswer: Int = 0
    @State var ChosenQuestion: Int = 0
    var difficultyLevel: Int = 0
    
    @Binding var questionDatas: [QuestionData1]
    
    @State var yourAnswers: [Int] = Array(repeating: 0, count: 5)
    @State var selectedAnswer: String = ""
    @State var selectedAnswerArray: [String] = Array(repeating: "", count: 5)

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
                            csDataManager.saveQuestion(modelContext, question: questionDatas[ChosenQuestion])
                        }
                    }.padding(.horizontal)
                    
                    Text(questionDatas[ChosenQuestion].question)
                        .font(.headline)
                    
                    List {
                        
                        Button(action: {
                            yourAnswer = 1
                            yourAnswers[ChosenQuestion] = yourAnswer
                          selectedAnswer = questionDatas[ChosenQuestion].answer1
                        }
                        ) {
                          Text("1. " + questionDatas[ChosenQuestion].answer1)
                        }
                        
                        Button(action: {
                            yourAnswer = 2
                            yourAnswers[ChosenQuestion] = yourAnswer
                          selectedAnswer = questionDatas[ChosenQuestion].answer2
                        }
                        ) {
                          Text("2. " + questionDatas[ChosenQuestion].answer2)
                        }
                        
                        Button(action: {
                            yourAnswer = 3
                            yourAnswers[ChosenQuestion] = yourAnswer
                          selectedAnswer = questionDatas[ChosenQuestion].answer3
                        }
                        ) {
                          Text("3. " + questionDatas[ChosenQuestion].answer3)
                        }
                        
                        Button(action: {
                            yourAnswer = 4
                            yourAnswers[ChosenQuestion] = yourAnswer
                          selectedAnswer = questionDatas[ChosenQuestion].answer4
                        })
                        {
                          Text("4. " + questionDatas[ChosenQuestion].answer4)
                        }
                    }
                    if yourAnswer != 0 {
              
                        Text("Your answer: \(yourAnswer). \(selectedAnswer)")
                    }
                }
                
                if ChosenQuestion < questionDatas.count - 1 {
                    Button(action:{
                        selectedAnswerArray[ChosenQuestion - 1] = selectedAnswer
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
                    
                    NavigationLink(destination: QuestionResultView(
                        questionDatas: questionDatas,
                        yourAnswers: yourAnswers,
                        selectedAnswerArray: selectedAnswerArray)) {
                        Text("다 풀었어요~")
                    }
                }
            }.padding(30)
        }
    }
}
  
//  #Preview {
//    CSQuestionView()
//  }
