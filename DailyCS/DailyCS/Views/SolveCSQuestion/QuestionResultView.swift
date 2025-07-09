//
//  QuestionResultView.swift
//  DailyCS
//
//  Created by Rental pc on 7/4/25.
//

import SwiftUI


/// TodayCS - front - QuestionResultView
/// 문제풀이 결과 화면
struct QuestionResultView: View {
  
  // 문제 배열
  var questionDatas: [QuestionData1] = []
  // 답 1~4번 중 선택
  var yourAnswers: [Int] = []
  // 선택한 답에 대한 텍스트
  var selectedAnswerArray: [String] = []
  // 맞춘 개수
  @State var correctCount = 0 // 맞춘 개수 카운트
  // 틀린 문제 모아두기
  @State var wrongQuestionArray: [QuestionData1] = []
  
  @State var score: Int = 0
  
  // 틀린 문제 가져오기
  func questionAnswers(){
    
    //초기화
    correctCount = 0
    wrongQuestionArray = []
    // 예제
    for (question, answer) in zip(questionDatas, yourAnswers) {
      print("질문: \(question.answer_number), 당신의 답변: \(answer)")
      if question.answer_number == answer {
        correctCount += 1
      }else {
        wrongQuestionArray.append(question)
      }
      
    }
    // 점수
    score = correctCount * 20
  }
  
  var body: some View {
    VStack(spacing: 16) {
      
      Text("점수: \(score)점")
        .font(.largeTitle)
        .bold()
        .padding(.top, 20)
      
      Text("틀린 문제 리스트")
        .font(.title)
        .fontWeight(.medium)
        .foregroundColor(.mainGreen)
      
      List {
        ForEach(wrongQuestionArray) { array in
        
          NavigationLink(destination: WrongQuestionView(questionData1: array)) {
            Text(array.question)
              .font(.headline)
              .foregroundColor(.black)
          }
          .padding()
          .background(Color.white)
          .cornerRadius(10)
          .shadow(color: Color.black.opacity(0.05), radius: 2, x: 0, y: 1)
          .listRowSeparator(.hidden)
          .listRowBackground(Color.clear)
        }
      }
      .listStyle(.plain)
      .background(Color.clear) // 리스트 배경 제거
      
      
      
      
    }
    .padding()
    .background(Color.clear)
    .onAppear {
      questionAnswers()
    }
    .navigationBarBackButtonHidden(true)
    .modifier(BackgroundStyle(navigationTitle: "오늘 점수", displayMode: .inline))
    .toolbar {
      ToolbarItem(placement: .topBarLeading) {
        Button {
          NavigationUtil.popToRootView()
        } label: {
          Image(systemName: "xmark")
        }
      }
    }
  }
}




//struct QuestionResultView_Previews: PreviewProvider {
//  static var previews: some View {
//    QuestionResultView()
//  }
//}
