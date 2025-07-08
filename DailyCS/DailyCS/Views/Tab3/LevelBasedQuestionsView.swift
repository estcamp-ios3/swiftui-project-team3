//
//  LevelBasedQuestionsView.swift
//  DailyCS
//
//  Created by 최용헌 on 7/8/25.
//

import SwiftUI

struct LevelBasedQuestionsView: View {
  @State var navigtaionTitle: String
  
    var body: some View {
      NavigationStack {
        
      }
      .modifier(BackgroundStyle(navigationTitle: navigtaionTitle))

        
    }
}

#Preview {
  LevelBasedQuestionsView(navigtaionTitle: "Easy")
}
