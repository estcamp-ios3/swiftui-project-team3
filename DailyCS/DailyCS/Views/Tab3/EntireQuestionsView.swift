//
//  EntireQuestionsView.swift
//  DailyCS
//
//  Created by 최용헌 on 7/7/25.
//

import SwiftUI


/// 레벨에 따른 케이스
enum LevelCase {
  case easy
  case normal
  case hard
  
  
  /// 버튼 및 네비게이션 타이틀
  var titleValue: String {
    switch self {
    case .easy: "Easy"
    case .normal: "Normal"
    case .hard: "Hard"
    }
  }
  
  
  /// 난이도 반환
  var convertNum: Int {
    switch self {
    case .easy: 1
    case .normal: 2
    case .hard: 3
    }
  }
}

struct EntireQuestionsView: View {
  
  @StateObject private var csDataManager = CSDataManager.shared
  
  @State private var selectedLevel: String = "전체"
  @State private var startIndex: Int = 1
  @State private var endIndex: Int = 10
  
  
  private var allLevels: [String] = [
    LevelCase.easy.titleValue,
    LevelCase.normal.titleValue,
    LevelCase.hard.titleValue
  ]
  
  
  var body: some View {
    
    NavigationStack {
      VStack {
        ScrollView(.horizontal, showsIndicators: false) {
          HStack(spacing: 17) {
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
        }
        
        Spacer()
        
        List(csDataManager.totalQuestions) { question in
          NavigationLink {
            //            SavedQuestionDetailView(question: question)
            
            Text("test")
          } label: {
            VStack(alignment: .leading, spacing: 10) {
              Text(selectedLevel)
              
              Text(question.question)
            }
          }
          .onAppear {
            
            // 리스트 스크롤 시 문제의 아이디가 서버에서 가져온 질문의 마지막 아이디와 같다면 데이터 더 불러오기
            // 불러오고 시간 텀 두기
            if question.id == csDataManager.totalQuestions.last?.id {
              
              DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                print("마지막")
                startIndex += 10
                endIndex += 10
                csDataManager.fetchCSQuestionWithPaging(level: convertLevel(), from: startIndex, to: endIndex)
              }
            }
          }
        }
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
    switch selectedLevel {
    case LevelCase.easy.titleValue: 1
    case LevelCase.normal.titleValue: 2
    case LevelCase.hard.titleValue: 3
    default:  1
    }
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
  
  
  /// 버튼 스타일
  struct LevelButtonStyle: ViewModifier {
    let color: Color
    func body(content: Content) -> some View {
      content
        .font(.title)
        .foregroundColor(.white)
        .padding()
        .frame(maxWidth: .infinity)
        .background(color)
        .cornerRadius(10)
    }
  }
  
  // 배경 스타일 + 네비게이션타이틀
  struct BackgroundStyle: ViewModifier {
    let navigationTitle: String
    func body(content: Content) -> some View {
      content
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.veryLightGreenBackground)
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.large)
    }
  }
  
  
  #Preview {
    EntireQuestionsView()
  }
