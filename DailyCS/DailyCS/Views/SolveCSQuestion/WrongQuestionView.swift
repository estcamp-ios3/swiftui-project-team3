//
//  WrongQuestionView.swift
//  DailyCS
//
//  Created by Rental pc on 7/9/25.
//

import SwiftUI
import SwiftData

struct WrongQuestionView: View {
  
  // 문제 저장 버튼 구현용 csDataManager 및 bool 변수, 경고문구 선언
  @StateObject private var csDataManager = CSDataManager.shared
  
  @Environment(\.modelContext) private var modelContext
  
  @Query(sort: \QuestionDataForSave.id) var savedQuestions: [QuestionDataForSave]
  
  @State var isSaved: Bool = false
  @State var alertMessage = ""
  
  // 틀린 질문데이터
  let wrongQuestionData : QuestionData
  
  var savedQuestionIDs: [Int] {
    return savedQuestions.map { $0.id }
  }
  
  // 사용자가 선택한 정답의 번호
  @State var seletedAnswerNum: Int
  
  
  var body: some View {
    VStack {
      
      ZStack {
        Color.veryLightGreenBackground
          .ignoresSafeArea()
        
        VStack(spacing: 16) {
          
          VStack(alignment: .leading){
            Text("문제 내용")
              .font(.headline)
              .padding(.vertical, 10)
            
            Text("선택하신 번호가 표시됩니다.")
              .font(.subheadline)
            
            Divider()
          }
          .padding(.horizontal, 20)
          
          // 문제 내용
          Text(wrongQuestionData.question)
            .font(.system(size: 20))
            .bold()
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 16)
          
          Divider()
            .padding(.horizontal, 20)

          // 1~4번 정답 보여주기
          ScrollView{
            VStack(alignment: .leading) {
              
              let answers = [
                wrongQuestionData.answer1,
                wrongQuestionData.answer2,
                wrongQuestionData.answer3,
                wrongQuestionData.answer4
              ]
              
              ForEach(0..<answers.count, id: \.self) { index in
                Text("\(index + 1)번: \(answers[index])")
                  .font(.headline)
                  .padding(8)
                  .frame(maxWidth: .infinity, alignment: .leading)
                  .background(seletedAnswerNum == index + 1 ? Color.yellow.opacity(0.3) : Color.clear)
                  .cornerRadius(8)
                  .lineLimit(nil)
                  .fixedSize(horizontal: false, vertical: true)
              }
              
              Spacer()
              
              // 문제에 대한 정답
              Text("정답: \(wrongQuestionData.answer_number) 번")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top ,8)
                .frame(maxWidth: .infinity, alignment: .center)
              
            }
            .padding()
            
            Spacer()
          }
        }
        .frame(maxWidth: .infinity)
        .padding(.top, 20)
      }
    }
    .toolbar {
      ToolbarItem(placement: .navigationBarTrailing){
        // 저장 버튼
        Button(action : {
          // 이미 저장된 경우 - 저장 x
          if savedQuestionIDs.contains(where: { $0 == wrongQuestionData.id }) {
            alertMessage = "이미 저장된 문제입니다."
          }else {
            // 저장된 목록에 없는 경우 - 저장
            csDataManager.saveQuestion(modelContext, question: wrongQuestionData)
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
  
}
//#Preview {
//
//    WrongQuestionView()
//
//
//        }
