//  SavedQuestionDetailView.swift
//  DailyCS
//
//  Created by 송서윤 on 7/4/25.
//

import SwiftUI
import SwiftData

/// 질문 상세 화면
struct SavedQuestionDetailView: View {
  @Bindable var question: QuestionDataForSave
  
  @Query(sort: \QuestionDataForSave.id) var savedQuestions: [QuestionDataForSave]
  
  @State var isSaved: Bool = false
  @State private var isCheckEditingAlert = false
  @State private var isCompleteEditingAlert = false
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
        Spacer()
        
        Text(question.question)
          .font(.system(size: 20))
          .bold()
          .multilineTextAlignment(.center)
          .padding(.horizontal)
        
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
          Text(question.answer)
            .font(.title)
            .bold()
            .padding(.vertical)
            .transition(.opacity)
        }
        
        Spacer()
      }
      .navigationTitle("문제 상세 (\(LevelName(rawValue: question.level)?.description ?? "\(question.level)"))")
      .navigationBarTitleDisplayMode(.inline)
      .navigationBarBackButtonHidden(true)
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          backButton
        }
        
        ToolbarItem(placement: .navigationBarTrailing) {
          Button {
            alertTitle = isSaved ? "나만의 노트에서 삭제할까요?" : "나만의 노트에 저장할까요?"
            alertResultTitle = isSaved ? "나만의 노트에서 삭제했어요." : "나만의 노트에 저장했어요."
            isCheckEditingAlert = true
          } label: {
            Image(systemName: isSaved ? "trash" : "folder.fill.badge.plus")
              .foregroundColor(isSaved ? .red : .black)
              .padding(.trailing, 10)
          }
        }
      }
      .alert(alertTitle, isPresented: $isCheckEditingAlert) {
        Button("취소하기", role: .cancel) { }
        
        Button {
          if isSaved {
            _ = CSDataManager.shared.deleteQuestion(modelContext, data: question)
            isSaved = false
          } else {
            CSDataManager.shared.saveQuestion(modelContext, question: question)
            isSaved = true
          }
          isCompleteEditingAlert = true
        } label: {
          Text(isSaved ? "삭제하기" : "저장하기")
            .foregroundColor(isSaved ? .red : .green)
        }
      }
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

