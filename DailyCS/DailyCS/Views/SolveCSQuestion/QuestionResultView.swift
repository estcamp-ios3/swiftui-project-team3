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
  var questionDatas: [QuestionData] = []
  
  // 사용자가 선택한 답변 번호 배열
  var yourAnswers: [Int] = []
  
  // 사용자가 선택한 답변 번호 중 틀린 번호 배열
  @State var wrongAnswers: [Int] = []

  // 맞춘 개수
  @State var correctCount = 0 // 맞춘 개수 카운트
  
  // 틀린 문제 모아두기
  @State var wrongQuestionArray: [QuestionData] = []
  
  // 점수
  @State var score: Int = 0
 
  var body: some View {
    VStack(spacing: 16) {
      
      // 점수 표시
      Text("점수: \(score)점")
        .font(.largeTitle)
        .bold()
        .padding(.top, 20)
      
      // 모든 문제를 맞췄을 경우
      if wrongAnswers.isEmpty {
       
        Spacer()
        
        VStack(spacing: 30) {
          Image(systemName: "checkmark.seal.fill")
            .resizable()
            .frame(width: 60, height: 60)
            .foregroundColor(.green)
          
          Text("모든 문제를 맞혔어요!")
            .font(.title2)
            .fontWeight(.semibold)
            .foregroundColor(.mainGreen)
        }
        
        Spacer()
        
      } else {
        // 틀린 문제가 있는 경우
        Text("틀린 문제 리스트")
          .font(.title2)
          .fontWeight(.medium)
          .foregroundColor(.mainGreen)
          .padding(.top, 8)
        
        // 틀린 문제 표시 리스트
        List {
          ForEach(Array(wrongQuestionArray.enumerated()), id: \.element.id) { index, array in
            NavigationLink(destination: WrongQuestionView(wrongQuestionData: array,
                                                          seletedAnswerNum: wrongAnswers[index])) {
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
        .background(Color.clear)
      }
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
          // x버튼 터치 시 루트로 이동
          NavigationUtil.popToRootView()
        } label: {
          Image(systemName: "xmark")
        }
      }
    }
  }

  
  // 틀린 문제 가져오기
  func questionAnswers(){
    
    //초기화
    correctCount = 0
    wrongQuestionArray = []
    
    // 전체 질문과 사용자가 고른 정답을 가지고 틀린 질문만 뽑기
    for (question, answer) in zip(questionDatas, yourAnswers) {
      if question.answer_number == answer {
        correctCount += 1
      }else {
        wrongQuestionArray.append(question)
        wrongAnswers.append(answer)
      }
    }
    // 점수
    score = correctCount * 20
  }
}




//struct QuestionResultView_Previews: PreviewProvider {
//  static var previews: some View {
//    QuestionResultView()
//  }
//}
