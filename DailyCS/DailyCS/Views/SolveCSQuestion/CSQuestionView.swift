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
  @State var isShowPopup: Bool = false // 뒤로가기 팝업창 제어용 bool
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
  
  
  // 난이도 별로 출력
  func printLevel() -> String {
    switch difficultyLevel {
    case 1: "난이도 Easy"
    case 2:"난이도 Normal"
    case 3: "난이도 Hard"
    default: "난이도를 선택해주세요."
    }
  }
  
  // 뒤로가기 버튼
  var backButton: some View {
    Button(action: {
      isShowPopup = true
    }) {
      Image(systemName: "chevron.backward")
    }
    .alert("첫 화면으로 돌아가시겠습니까?", isPresented: $isShowPopup) {
      

      Button("확인", role: .cancel) {
        dismiss()
      }.bold(true)
      
      Button("취소") {
      }
      .bold(true)
      
    } message: {
      Text("진행 중인 문제는 저장되지 않습니다.").font(.headline)
    }
  }
  
  var body: some View {
    ZStack {
      Color.veryLightGreenBackground.ignoresSafeArea()
      
      VStack {
        VStack(alignment: .leading) {
          
          Text("\(chosenQuestion + 1)번 문제")
            .font(.title3)
            .padding(.bottom, 10)
            .foregroundColor(Color.darkGrayText)
          
          Divider()
          
          // 질문 출력
          Text(questionDatas[chosenQuestion].question)
            .font(.title3)
            .fontWeight(.bold)
            .padding(.top, 10)
          
          // 정답 선택
          ScrollView {
            VStack(alignment: .leading, spacing: 10) {
              let answers = [
                questionDatas[chosenQuestion].answer1,
                questionDatas[chosenQuestion].answer2,
                questionDatas[chosenQuestion].answer3,
                questionDatas[chosenQuestion].answer4
              ]
              
              ForEach(0..<answers.count, id: \.self) { index in
                Button(action: {
                  yourAnswer = index + 1
                  yourAnswers[chosenQuestion] = yourAnswer
                  selectedAnswer = answers[index]
                }) {
                  Text("\(index + 1). \(answers[index])")
                    .multilineTextAlignment(.leading)
                    .padding()
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                }
                .background(yourAnswer == index + 1 ? Color.lightLime.opacity(0.8) : Color.lightLime.opacity(0.2))
                .cornerRadius(10)
              }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            
          }
          
          // 이전문제 , 다음문제로 이동하는 버튼
          HStack {
            Button(action:{
              selectedAnswerArray[chosenQuestion] = selectedAnswer
              chosenQuestion -= 1
              yourAnswer = yourAnswers[chosenQuestion]
            }) {
              Text("이전 문제")
                .modifier(CustomButtonStyle(color: chosenQuestion == 0 ? .gray : .correctGreen))
            }.disabled(chosenQuestion == 0)
            
            // 마지막 문제가 아닌 경우 다음 문제로
            if chosenQuestion < questionDatas.count - 1 {
              Button(action:{
                selectedAnswerArray[chosenQuestion] = selectedAnswer
                chosenQuestion += 1
                yourAnswer = yourAnswers[chosenQuestion]
              }) {
                Text("다음 문제")
                  .modifier(CustomButtonStyle(color: yourAnswer == 0 ? .gray : .mainGreen))
              }.disabled(yourAnswer == 0)
            }
            else{
              // 마지막 문제에 도달한 경우 결과보기 화면으로 이동
              NavigationLink(destination: QuestionResultView(
                questionDatas: questionDatas,
                yourAnswers: yourAnswers,
                selectedAnswerArray: selectedAnswerArray)) {
                  Text("결과 보기").modifier(CustomButtonStyle(color: yourAnswer == 0 ? .gray : .mainGreen))
                  
                }
                .disabled(yourAnswer == 0)
              
            }
          }
        }.padding(30)
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
                Image(systemName: "square.and.arrow.down.on.square.fill")
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
}


//  #Preview {
//    CSQuestionView()
//  }
