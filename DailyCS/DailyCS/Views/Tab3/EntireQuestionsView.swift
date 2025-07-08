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
        Text("난이도를 선택하세요")
          .padding(.bottom, 40)
        
        VStack(alignment: .center, spacing: 20) {
          
          NavigationLink("Easy",destination: LevelBasedQuestionsView())
          NavigationLink("Normal",destination: LevelBasedQuestionsView())
          NavigationLink("Hard",destination: LevelBasedQuestionsView())
    

        }
        
      }
      .background(Color.veryLightGreenBackground)
      .navigationTitle("전체 문제")
      .navigationBarTitleDisplayMode(.large)

        
    }
}

#Preview {
    EntireQuestionsView()
}
