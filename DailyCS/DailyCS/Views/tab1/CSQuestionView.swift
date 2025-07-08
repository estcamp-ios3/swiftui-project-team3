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
    @State var isSaved: Bool = false
    
    func printLevel() -> String {
        switch difficultyLevel {
        case 1:
            "난이도 Easy"
        case 2:
            "난이도 Normal"
        case 3:
            "난이도 Hard"
       
        default:
            "난이도를 선택해주세요."
        }
    }

    var body: some View {
        ZStack
        {
            Color.veryLightGreenBackground.ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading) {
                    
                    Text("\(ChosenQuestion + 1)번 문제")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    Text(questionDatas[ChosenQuestion].question)
                        .font(.headline)
                    
                    ScrollView {
                        VStack(alignment: .leading){
                            Button(action: {
                                yourAnswer = 1
                                yourAnswers[ChosenQuestion] = yourAnswer
                                selectedAnswer = questionDatas[ChosenQuestion].answer1
                            }
                            ){
                                Text("1. " + questionDatas[ChosenQuestion].answer1)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .background(yourAnswer == 1 ? Color.lightLime.opacity(0.2) : Color.clear)
                            }
                            
                            
                            Button(action: {
                                yourAnswer = 2
                                yourAnswers[ChosenQuestion] = yourAnswer
                                selectedAnswer = questionDatas[ChosenQuestion].answer2
                            }
                            ) {
                                Text("2. " + questionDatas[ChosenQuestion].answer2)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .background(yourAnswer == 2 ? Color.lightLime.opacity(0.2) : Color.clear)
                            }.padding()
                            
                            Button(action: {
                                yourAnswer = 3
                                yourAnswers[ChosenQuestion] = yourAnswer
                                selectedAnswer = questionDatas[ChosenQuestion].answer3
                            }
                            ) {
                                Text("3. " + questionDatas[ChosenQuestion].answer3)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .background(yourAnswer == 3 ? Color.lightLime.opacity(0.2) : Color.clear)
                            }.padding()
                            
                            Button(action: {
                                yourAnswer = 4
                                yourAnswers[ChosenQuestion] = yourAnswer
                                selectedAnswer = questionDatas[ChosenQuestion].answer4
                            })
                            {
                                Text("4. " + questionDatas[ChosenQuestion].answer4)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .background(yourAnswer == 4 ? Color.lightLime.opacity(0.2) : Color.clear)
                            }.padding()
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
                        if yourAnswer != 0 {
                            
                            Text("답변 : \(yourAnswer). \(selectedAnswer)")
                                .font(.headline)
                                .foregroundColor(.black)
                                .padding(10)
                                .background(Color.gray.opacity(0.2))
                        }
                    }
                }
                
                if ChosenQuestion < questionDatas.count - 1 {
                    Button(action:{
                        selectedAnswerArray[ChosenQuestion] = selectedAnswer
                        yourAnswer = 0
                        ChosenQuestion += 1
                        
                    }) {
                        Text("다음 문제")
                            .modifier(LevelButtonStyle(color: .correctGreen))
                    }
                }
                else{
                    
                    NavigationLink(destination: QuestionResultView(
                        questionDatas: questionDatas,
                        yourAnswers: yourAnswers,
                        selectedAnswerArray: selectedAnswerArray)) {
                            Text("다 풀었어요~").modifier(LevelButtonStyle(color: .correctGreen))
                    }
                }
            }.padding(30)
                .navigationTitle(printLevel())
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action : {
                            csDataManager.saveQuestion(modelContext, question: questionDatas[ChosenQuestion])
                            isSaved = true
                        }) {
                            Text("문제 저장")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(5)
                                .background(Color.correctGreen)
                                .cornerRadius(10)
                        }.alert(isPresented: $isSaved) {
                            Alert(title: Text("저장되었습니다."),
                                  dismissButton: .default(Text("OK")))
                        }
                    }
                }
            }
    }
}

  
//  #Preview {
//    CSQuestionView()
//  }
