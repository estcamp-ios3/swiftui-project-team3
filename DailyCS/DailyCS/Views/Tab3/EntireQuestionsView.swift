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
  
  var value: String {
    switch self {
    case .easy: "Easy"
    case .normal: "Normal"
    case .hard: "Hard"
    }
  }
}

struct EntireQuestionsView: View {
  
  var body: some View {
    NavigationStack {
      VStack(alignment: .leading){
        Text("난이도를 선택하세요")
          .padding(.horizontal, 20)
        
        Spacer()

        VStack(alignment: .center, spacing: 20) {
          NavigationLink(destination: LevelBasedQuestionsView(navigtaionTitle: LevelCase.easy.value)) {
            Text(LevelCase.easy.value)
              .modifier(LevelButtonStyle(color: .correctGreen))
          }

          NavigationLink(destination: LevelBasedQuestionsView(navigtaionTitle: LevelCase.normal.value)) {
            Text(LevelCase.normal.value)
              .modifier(LevelButtonStyle(color: .correctGreen))
          }

          NavigationLink(destination: LevelBasedQuestionsView(navigtaionTitle: LevelCase.hard.value)) {
            Text(LevelCase.hard.value)
              .modifier(LevelButtonStyle(color: .correctGreen))
          }
        }
        .padding(.horizontal, 16)
        Spacer()
      }
      .modifier(BackgroundStyle(navigationTitle: "전체 문제"))
    }
  }
}


/// 버튼 스타일
struct LevelButtonStyle: ViewModifier {
  let color: Color
  func body(content: Content) -> some View {
    content
      .font(.headline)
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
