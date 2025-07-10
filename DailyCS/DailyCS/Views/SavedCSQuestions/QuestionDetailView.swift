//  SavedQuestionDetailView.swift
//  DailyCS
//
//  Created by 송서윤 on 7/4/25.
//

import SwiftUI
import SwiftData

/// TodayCS - front - QuestionDetailView
/// 질문 상세 화면
struct QuestionDetailView: View {
  // 저장된 질문
  @Bindable var question: QuestionDataForSave
  
  @Query(sort: \QuestionDataForSave.id) var savedQuestions: [QuestionDataForSave]
  
  // 저장여부 확인 - 저장되었으면 true , 안되었으면 false
  @State var isSaved: Bool = false
  
  // 저장 및 삭제 알람 체크
  @State private var isCheckEditingAlert = false
  
  // 저장 및 삭제 완료 알람 체크
  @State private var isCompleteEditingAlert = false
  
  // 정답버튼이 터치되었는지 여부
  @State private var showAnswer = false
  
  @State private var alertTitle = ""
  @State private var alertResultTitle = ""
  
  @Environment(\.dismiss) var dismiss
  @Environment(\.modelContext) var modelContext
  @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>

  var body: some View {
    ZStack {
      Color.veryLightGreenBackground.ignoresSafeArea()
      
      VStack(spacing: 20) {
          
        VStack(alignment: .leading){
          Text("문제 내용")
            .font(.headline)
            .padding(.top, 40)
          
          Divider()
        }
        .padding(.horizontal, 20)

        
        // 문제 내용
        Text(question.question)
          .font(.system(size: 20))
          .bold()
          .multilineTextAlignment(.leading)
          .padding(20)
          .frame(maxWidth: .infinity, alignment: .leading)
          .background(
            RoundedRectangle(cornerRadius: 12)
              .fill(Color.lightLime)
          )
          .padding(.horizontal, 10)

        
        Spacer()

        // 정답보기 버튼
        if !showAnswer {
          Button("정답보기") {
            withAnimation {
              showAnswer = true
            }
          }
          .font(.title)
          .buttonStyle(.borderedProminent)
          .tint(.correctGreen)
          .padding(.top, 20)
        } else {
          // 정답보기 버튼이 눌린 경우 해당 질문에 대한 정답 출력
          Text(question.answer)
            .font(.title)
            .bold()
            .padding(.vertical)
            .transition(.opacity)
        }
        
        Spacer()
      }
      .navigationBarBackButtonHidden(true)
      .toolbar {
        // 뒤로가기 버튼
        ToolbarItem(placement: .navigationBarLeading) {
          backButton
        }
        
        // 저장 및 삭제 버튼
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            alertTitle = isSaved ? "나만의 노트에서 삭제할까요?" : "나만의 노트에 저장할까요?"
            alertResultTitle = isSaved ? "나만의 노트에서 삭제했어요." : "나만의 노트에 저장했어요."
            isCheckEditingAlert = true
          } label: {
            Image(systemName: isSaved ? "trash" : "folder.fill.badge.plus")
              .foregroundColor(isSaved ? .red : .accentGreen)
              .padding(.trailing, 10)
          }
        }
      }
      // 질문 삭제 및 저장 얼랏
      .alert(alertTitle, isPresented: $isCheckEditingAlert) {
        Button("취소하기") { }

        Button(isSaved ? "삭제하기" : "저장하기") {
          // 저장되어 있는 경우 삭제
          if isSaved {
            _ = CSDataManager.shared.deleteQuestion(modelContext, data: question)
            isSaved = false
          } else {
            // 저장이 안되어 있는 경우 저장
            CSDataManager.shared.saveQuestion(modelContext, question: question)
            isSaved = true
          }
          isCompleteEditingAlert = true
        }
        .foregroundStyle(Color.accentColor)

      }
      // 질문 삭제 및 저장 확인 얼랏
      .alert(alertResultTitle, isPresented: $isCompleteEditingAlert) {
        Button("확인", role: .cancel) {
          dismiss()
        }
      }
      .onAppear {
        isSaved = savedQuestions.contains(where: { $0.id == question.id })
      }
    }
  }
  
  // 뒤로가기 버튼
  var backButton: some View {
    Button {
      presentationMode.wrappedValue.dismiss()
    } label: {
      HStack {
        Image(systemName: "chevron.left")
              .font(.title2)
              .aspectRatio(contentMode: .fit)
              .foregroundColor(.mainGreen)

      }
    }
  }
}



//#Preview {
//    NavigationStack {
//            SavedQuestionDetailView(question: previewQuestion)
//        }
//}

