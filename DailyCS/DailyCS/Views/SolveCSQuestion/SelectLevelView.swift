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
          
          // 선택한 난이도에 대한 설명
          Text(LevelCase.printLevel(for: difficultyLevel).description)
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
            // 화면이동시 질문을 같이 넘겨줌
            CSQuestionView(questionDatas: $csDataManager.questions)
          }
          .modifier(BackgroundStyle(navigationTitle: "난이도 선택"))

    }
  }
}

#Preview {
  SelectLevelView()
}
