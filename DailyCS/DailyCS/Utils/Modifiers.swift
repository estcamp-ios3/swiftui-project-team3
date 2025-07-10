//
//  Modifiers.swift
//  DailyCS
//
//  Created by 최용헌 on 7/9/25.
//

import Foundation
import SwiftUI

/// 버튼 스타일
struct CustomButtonStyle: ViewModifier {
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
  var displayMode: NavigationBarItem.TitleDisplayMode = .large
  
  func body(content: Content) -> some View {
    content
      .frame(maxWidth: .infinity, maxHeight: .infinity)
      .background(Color.veryLightGreenBackground)
      .navigationTitle(navigationTitle)
      .navigationBarTitleDisplayMode(displayMode)
  }
}
