//
//  EntireQuestionsView.swift
//  DailyCS
//
//  Created by 최용헌 on 7/7/25.
//

import SwiftUI

struct EntireQuestionsView: View {
  
  var body: some View {
    NavigationStack {
      VStack(alignment: .leading){
        Text("난이도를 선택하세요")
          .padding(.horizontal, 20)
        
        Spacer()

        VStack(alignment: .center, spacing: 20) {
          NavigationLink(destination: LevelBasedQuestionsView()) {
            Text("Easy")
              .modifier(LevelButtonStyle(color: .correctGreen))
          }

          NavigationLink(destination: LevelBasedQuestionsView()) {
            Text("Normal")
              .modifier(LevelButtonStyle(color: .correctGreen))
          }

          NavigationLink(destination: LevelBasedQuestionsView()) {
            Text("Hard")
              .modifier(LevelButtonStyle(color: .correctGreen))
          }
        }
        .padding(.horizontal, 16)
        Spacer()
      }
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.veryLightGreenBackground)
      .navigationTitle("전체 문제")
      .navigationBarTitleDisplayMode(.large)
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


#Preview {
  EntireQuestionsView()
}
