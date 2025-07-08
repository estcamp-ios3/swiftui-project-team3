//
//  CSQuestionView.swift
//  DailyCS
//
//  Created by home on 7/4/25.
//

import SwiftUI
import SwiftData

/// TodayCS - front - CSQuestionView
/// 문제 풀이 화면
struct CSQuestionView: View {
  @StateObject private var csDataManager = CSDataManager.shared
  
  // SwiftData로 로컬에 저장된 문제들
  @Query(sort: \QuestionDataForSave.id) var savedQuestions: [QuestionDataForSave]
  
  // 저장된 문제들의 ID만 따로 뺀 배열
  var savedQuestionIDs: [Int] {
    return savedQuestions.map { $0.id }
  }
  
    @Environment(\.modelContext) private var modelContext
    @State var yourAnswer: Int = 0
    @State var chosenQuestion: Int = 0
    var difficultyLevel: Int = 0
    
    @Binding var questionDatas: [QuestionData1]
    
    @State var yourAnswers: [Int] = Array(repeating: 0, count: 5)
    @State var selectedAnswer: String = ""
    @State var selectedAnswerArray: [String] = Array(repeating: "", count: 5)
    @State var isSaved: Bool = false
    @State var alertMessage = ""
    
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
                    
                    Text("\(chosenQuestion + 1)번 문제")
                        .font(.headline)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    Text(questionDatas[chosenQuestion].question)
                        .font(.headline)
                    
                    ScrollView {
                        VStack(alignment: .leading){
                            Button(action: {
                                yourAnswer = 1
                                yourAnswers[chosenQuestion] = yourAnswer
                                selectedAnswer = questionDatas[chosenQuestion].answer1
                            }
                            ){
                                Text("1. " + questionDatas[chosenQuestion].answer1)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .background(yourAnswer == 1 ? Color.lightLime.opacity(0.2) : Color.clear)
                            }
                            
                            
                            Button(action: {
                                yourAnswer = 2
                                yourAnswers[chosenQuestion] = yourAnswer
                                selectedAnswer = questionDatas[chosenQuestion].answer2
                            }
                            ){
                                Text("2. " + questionDatas[chosenQuestion].answer2)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .background(yourAnswer == 2 ? Color.lightLime.opacity(0.2) : Color.clear)
                            }
                            
                            Button(action: {
                                yourAnswer = 3
                                yourAnswers[chosenQuestion] = yourAnswer
                                selectedAnswer = questionDatas[chosenQuestion].answer3
                            }
                            ){
                                Text("3. " + questionDatas[chosenQuestion].answer3)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .background(yourAnswer == 3 ? Color.lightLime.opacity(0.2) : Color.clear)
                            }
                            
                            Button(action: {
                                yourAnswer = 4
                                yourAnswers[chosenQuestion] = yourAnswer
                                selectedAnswer = questionDatas[chosenQuestion].answer4
                            }
                            ){
                                Text("4. " + questionDatas[chosenQuestion].answer4)
                                    .multilineTextAlignment(.leading)
                                    .padding()
                                    .background(yourAnswer == 4 ? Color.lightLime.opacity(0.2) : Color.clear)
                            }
                        }.frame(maxWidth: .infinity, alignment: .leading)
                        
//                        if yourAnswer != 0 {
//                            
//                            Text("답변 : \(yourAnswer). \(selectedAnswer)")
//                                .font(.headline)
//                                .foregroundColor(.black)
//                                .padding(10)
//                                .background(Color.gray.opacity(0.2))
//                        }
                    }
                }
                
                if chosenQuestion < questionDatas.count - 1 {
                    Button(action:{
                        selectedAnswerArray[chosenQuestion] = selectedAnswer
                        yourAnswer = 0
                        chosenQuestion += 1
                    }) {
                        Text("다음 문제")
                            .modifier(CustomButtonStyle(color: yourAnswer == 0 ? .gray : .correctGreen))
                    }.disabled(yourAnswer == 0)
                }
                else{
                    
                    NavigationLink(destination: QuestionResultView(
                        questionDatas: questionDatas,
                        yourAnswers: yourAnswers,
                        selectedAnswerArray: selectedAnswerArray)) {
                            Text("다 풀었어요~").modifier(CustomButtonStyle(color: .correctGreen))
                    }
                }
            }.padding(30)
                .navigationTitle(printLevel())
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing){
                        Button(action : {
                          
                          // 이미 저장된 경우 - 저장 x
                          if savedQuestionIDs.contains(where: { $0 == questionDatas[chosenQuestion].id }) {
                            print("이미 저장됨")
                            alertMessage = "이미 저장된 문제입니다."
                          }else {
                            // 저장된 목록에 없는 경우 - 저장
                            csDataManager.saveQuestion(modelContext, question: questionDatas[chosenQuestion])
                            alertMessage = "문제가 저장되었습니다."
                          }
                          isSaved = true
                        }) {
                            Text("문제 저장")
                                .font(.headline)
                                .foregroundColor(.white)
                                .padding(5)
                                .background(Color.correctGreen)
                                .cornerRadius(10)
                        }.alert(alertMessage, isPresented: $isSaved) {
                          Button("확인", role: .cancel) {}
                        }
                    }
                }
            }
    }
}

  
//  #Preview {
//    CSQuestionView()
//  }
