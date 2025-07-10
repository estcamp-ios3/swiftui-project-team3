//
//  EntireQuestionsView.swift
//  DailyCS
//
//  Created by 최용헌 on 7/7/25.
//

import SwiftUI
import SwiftData

/// TodayCS - front - EntireQuestionsView
/// 전체 질문 화면
struct EntireQuestionsView: View {
  
  @StateObject private var csDataManager = CSDataManager.shared
  
  // SwiftData로 로컬에 저장된 문제들
  @Query(sort: \QuestionDataForSave.id) var savedQuestions: [QuestionDataForSave]
  
  // 저장된 문제들의 ID만 따로 뺀 배열
  var savedQuestionIDs: [Int] {
    return savedQuestions.map { $0.id }
  }
  
  // 선택된 난이도
  @State private var selectedLevel: String = "전체"
  
  // 스크롤 시 추가로 불러올 데이터의 처음 인덱스(startIndex ~ endIndex 범위로 불러옴)
  @State private var startIndex: Int = 1
  
  // 스크롤 시 추가로 불러올 데이터의 마지막 인덱스
  @State private var endIndex: Int = 10
  
  // 모든 난이도에 대한 타이틀
  private var allLevels: [String] {
    LevelCase.allCases.map { $0.titleValue }
  }

  
  var body: some View {
    
    NavigationStack {
      VStack(alignment: .leading) {
        // 난이도 버튼
          HStack {
            Button("전체") {
              selectedLevel = "전체"
              fetchQeustions()
            }
            .buttonStyle(.borderedProminent)
            .tint(selectedLevel == "전체" ? .correctGreen : .gray)
            .font(.headline)
            
            ForEach(allLevels, id: \.self) { level in
              Button(level){
                selectedLevel = level
                fetchQeustions()
              }
              .buttonStyle(.borderedProminent)
              .tint(selectedLevel == level ? .correctGreen : .gray)
              .font(.headline)
            }
          }
          .padding(.horizontal, 20)
        
        
        Spacer()
        
        // 전체 질문에 대한 리스트
        List(csDataManager.totalQuestions) { question in
          // 터치 시 질문에 대한 상세화면으로 이동
          NavigationLink {
            let isSaved = savedQuestions.contains(where: { $0.id == question.id })
            
            let data = savedQuestions.first(where: { $0.id == question.id }) ?? QuestionDataForSave(with: question)
            
            QuestionDetailView(question: data, isSaved: isSaved)
            
          } label: {
            VStack(alignment: .leading, spacing: 10) {
              // 질문에 대한 난이도
              Text(LevelCase.converToString(for: question.level))
              
              // 질문 내용
              Text(question.question)
            }
          }
          
          .onAppear {
            
            // 리스트 스크롤 시 문제의 아이디가 서버에서 가져온 질문의 마지막 아이디와 같다면 데이터 더 불러오기
            // 불러오고 시간 텀 두기
            if question.id == csDataManager.totalQuestions.last?.id {
              
              DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                startIndex += 10
                endIndex += 10
                csDataManager.fetchCSQuestionWithPaging(level: convertLevel(),
                                                        from: startIndex,
                                                        to: endIndex)
              }
            }
          }
        }
        .listRowSpacing(20)
        .scrollContentBackground(.hidden)
        .background(Color.veryLightGreenBackground)
        .onAppear {
          // 처음 리스트 시작 시 서버에서 데이터 가져오기
          csDataManager.fetchCSQuestionWithPaging()
        }
      }
      .modifier(BackgroundStyle(navigationTitle: "전체 문제"))
    }
  }
  
  
  ///  convert 레벨  to Int level
  func convertLevel() -> Int {
    return LevelCase.fromTitle(selectedLevel)?.rawValue ?? 1
  }
  
  
  /// 질문 가져오기
  func fetchQeustions(){
    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
      startIndex = 0
      endIndex = 10
      csDataManager.totalQuestions.removeAll()
      csDataManager.fetchCSQuestionWithPaging(level: convertLevel(), from: startIndex, to: endIndex)
    }
  }
}




#Preview {
  EntireQuestionsView()
}
