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
    @Environment(\.dismiss) var dismiss
    @State var yourAnswer: Int = 0
    @State var chosenQuestion: Int = 0
    @State var isShowPopup: Bool = false
    var difficultyLevel: Int = 0
    
    @Binding var questionDatas: [QuestionData1]
    
    //사용자가 제출한 정답 번호를 저장하는 배열
    @State var yourAnswers: [Int] = Array(repeating: 0, count: 5)
    
    //제출한 정답 번호에 해당하는 답안 내용을 저장해두고 QuestionResultView로 넘기기 위한 변수
    @State var selectedAnswer: String = ""
    @State var selectedAnswerArray: [String] = Array(repeating: "", count: 5)
    
    //문제 저장 버튼에서 쓸 bool과 알림 메세지용 string
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
    
    struct BackPopup: View {
        @Binding var isShowingPopup: Bool
        var onConfirm: () -> Void
        
        var body: some View {
            VStack {
                Spacer()
                Text("첫 화면으로 돌아가시겠습니까?")
                    .font(.title).bold()
                    .padding(.horizontal)
                
                Spacer()
                
                HStack{
                    Button("확인") {	
                        onConfirm()
                        isShowingPopup = false
                    }.font(.title).bold(true).padding(.horizontal)
                    
                    Button("취소", role: .cancel){
                        isShowingPopup = false
                    }.font(.title).bold(true).padding(.horizontal)
                }
                Spacer()
            }
        }
    }
    var backButton: some View {
        Button(action: {
            isShowPopup = true
        }) {
            Text("처음으로")
                .font(.headline)
        }.sheet(isPresented: $isShowPopup) {
            BackPopup(
                isShowingPopup: $isShowPopup,
                onConfirm: {
                    dismiss() // CSQuestionView의 dismiss가 전달됨
                }
            ).presentationDetents([.fraction(0.3)])
        }
    }

    var body: some View {
        ZStack
        {
            Color.veryLightGreenBackground.ignoresSafeArea()
            
            VStack {
                VStack(alignment: .leading) {
                    
                    Text("\(chosenQuestion + 1)번 문제")
                        .font(.title2)
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                        .foregroundColor(Color.darkGrayText)
                    Text(questionDatas[chosenQuestion].question)
                        .font(.title3)
                        .fontWeight(.bold)
                        
                    
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
                                    .foregroundColor(Color.black)
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
                                    .foregroundColor(Color.black)

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
                                    .foregroundColor(Color.black)

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
                                    .foregroundColor(Color.black)

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
                HStack {
                    
                    Button(action:{
                        selectedAnswerArray[chosenQuestion] = selectedAnswer
                        chosenQuestion -= 1
                        yourAnswer = yourAnswers[chosenQuestion]
                    }) {
                        Text("이전 문제")
                            .modifier(CustomButtonStyle(color: chosenQuestion == 0 ? .gray : .correctGreen))
                    }.disabled(chosenQuestion == 0)
                    
                    if chosenQuestion < questionDatas.count - 1 {
                        Button(action:{
                            selectedAnswerArray[chosenQuestion] = selectedAnswer
                            chosenQuestion += 1
                            yourAnswer = yourAnswers[chosenQuestion]
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
                                Text("결과 보기").modifier(CustomButtonStyle(color: yourAnswer == 0 ? .gray : .correctGreen))
                            }.disabled(yourAnswer == 0)
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
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading: backButton)
    }
}

  
//  #Preview {
//    CSQuestionView()
//  }
