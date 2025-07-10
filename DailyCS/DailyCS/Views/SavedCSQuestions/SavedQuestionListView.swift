//  SavedQuestionView.swift
//  DailyCS
//
//  Created by 송서윤 on 7/4/25.
//

import SwiftUI
import SwiftData


/// TodayCS - front - SavedQuesionListView
/// 저장된 문제리스트 화면
struct SavedQuestionListView: View {
  // 저장되어 있는 질문
  @Query(sort: \QuestionDataForSave.id) var savedQuestions: [QuestionDataForSave]
  @Environment(\.modelContext) private var modelContext
  
  // 네트워크
  private let csDataManager = CSDataManager.shared
  
  // 선택한 난이도 - 전체, Easy, Normal, Hard
  @State private var selectedLevel: Int? = nil

  // 모든 난이도 배열
  private var allLevels: [LevelCase] {
    LevelCase.allCases
  }

  // 난이도별로 질문 필터링
  private var filteredQuestions: [QuestionDataForSave] {
    if let levelRawValue = selectedLevel {
      return savedQuestions.filter { $0.level == levelRawValue }
    } else {
      return savedQuestions.sorted(by: { $0.level < $1.level })
    }
  }
  
  var body: some View {
    NavigationStack {
      ZStack {
        Color.veryLightGreenBackground.ignoresSafeArea()
        
        VStack(alignment: .leading) {
          
          // 난이도 버튼 - 전체, Easy, Normal, Hard
          HStack {
            Button("전체") {
              selectedLevel = nil
            }
            .buttonStyle(.borderedProminent)
            .tint(selectedLevel == nil ? .correctGreen : .gray)
            .font(.headline)

            ForEach(allLevels) { level in
              Button(level.titleValue) {
                selectedLevel = level.rawValue
              }
              .buttonStyle(.borderedProminent)
              .tint(selectedLevel == level.rawValue ? .correctGreen : .gray)
              .font(.headline)
            }
          }
          .padding(.horizontal, 20)
          .frame(maxWidth: .infinity, alignment: .leading)

          // 저장된 문제가 없는 경우
          if filteredQuestions.isEmpty {
            VStack {
              Spacer()
              
              Text("저장한 문제가 없습니다")
                .font(.title3)
                .foregroundStyle(.gray)
              
              Spacer()
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
          } else {
            // 저장된 문제가 있는 경우
            List {
              ForEach(filteredQuestions) { question in
                HStack {
                  
                  Spacer()
                  
                  // 저장된 질문 상세화면으로 이동
                  NavigationLink(destination: QuestionDetailView(question: question)) {
                    VStack(alignment: .leading, spacing: 8) {
                      // 문제의 레벨
                      Text(LevelCase.converToString(for: question.level))
                        .font(.caption)
                        .foregroundColor(.darkGrayText)

                      // 문제 내용
                      Text(question.question)
                        .font(.headline)
                    }
                  }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(10)
                .listRowSeparator(.hidden)
                .listRowBackground(Color.veryLightGreenBackground)
                .listRowInsets(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
              }
            }
            .listStyle(.automatic)
            .scrollContentBackground(.hidden)
            .background(Color.veryLightGreenBackground)
          }
        }
      }
      .navigationBarTitle("저장된 문제 리스트")
      .navigationBarTitleDisplayMode(.large)
    }
  }
}


#Preview {
  NavigationStack{
    SavedQuestionListView()
  }
}
