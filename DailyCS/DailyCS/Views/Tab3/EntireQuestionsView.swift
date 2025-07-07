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
        
        VStack {
          Button {
            print("Easy")
            CSDataManager().fetchCSQuestionWithPaging()
          } label: {
            Text("Easy")
          }
          
          Button {
            print("Normal")
          } label: {
            Text("Normal")
          }
          
          Button {
            print("Hard")
          } label: {
            Text("Hard")
          }

        }
      }
      .background(Color.veryLightGreenBackground)
      .navigationTitle(Text("전체 문제"))
      .navigationBarTitleDisplayMode(.large)

        
    }
}

#Preview {
    EntireQuestionsView()
}
