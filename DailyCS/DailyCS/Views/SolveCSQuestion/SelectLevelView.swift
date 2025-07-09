//
//  SelectLevelView.swift
//  DailyCS
//
//  Created by home on 7/4/25.
//

import SwiftUI

/// TodayCS - front - SelectLevelView
/// 난이도 선택화면
struct SelectLevelView: View {
  @StateObject private var csDataManager: CSDataManager = CSDataManager.shared
  
  @State var difficultyLevel: Int = 1
  
  var body: some View {
    NavigationStack {

        VStack {
          Spacer()
          
          // 난이도 선택 버튼
          ForEach(LevelCase.allCases, id: \.self) { level in
            Button(action: {
              difficultyLevel = level.rawValue
            }) {
              Text(level.titleValue)
                .bold()
                .foregroundColor(difficultyLevel == level.rawValue ? Color.yellow : Color.white)
                .modifier(CustomButtonStyle(color: .correctGreen))
            }
            .border(Color.yellow, width: difficultyLevel == level.rawValue ? 5 : 0)
            .cornerRadius(5)
            .padding()
          }

          Spacer()
          
          Text(printLevel())
            .font(.headline)
          
          Spacer()
          
          // 문제 풀기 시작하기 버튼
          Button(action: {
            // 문제 받아오기
            csDataManager.fetchCSQuestion(level: difficultyLevel)
          }) {
            Text("시작하기")
              .modifier(CustomButtonStyle(color: .mainGreen))
              .padding()
          }
        }.font(.title)
          .padding()
          .navigationDestination(isPresented: $csDataManager.isLoaded) {
            CSQuestionView(difficultyLevel: difficultyLevel,
                           questionDatas: $csDataManager.questions)
          }
          .modifier(BackgroundStyle(navigationTitle: "난이도 선택"))

    }
  }
  
  
  /// 선택한 난이도에 대한 설명
  /// - Returns: 난이도에 대한 설명
  func printLevel() -> String {
    switch difficultyLevel {
    case 1:  "해당 난이도는 0 ~ 1년차 대상입니다."
    case 2:  "해당 난이도는 1 ~ 3년차 대상입니다."
    case 3:  "해당 난이도는 5 ~ 7년차 이상 대상입니다."
    default: "난이도를 선택해주세요."
    }
  }
}

#Preview {
  SelectLevelView()
}
