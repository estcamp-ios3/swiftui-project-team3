//
//  ContentView.swift
//  DailyCS
//
//  Created by 최용헌 on 7/4/25.
//

import SwiftUI

 
struct ContentView: View {
  @State private var isLaunch: Bool = true
  
  var body: some View {
    // 런치스크린 띄우기
    if isLaunch {
      LaunchView()
        .onAppear {
          // 1.5초 뒤에 해제
          DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
            withAnimation(.linear) {
              self.isLaunch = false
            }
            
          }
        }
    }else {
      
      TabView {
        Tab("문제 풀이", systemImage: "house") {
          SelectLevelView()
        }
        
        Tab("저장된 문제", systemImage: "note.text.badge.plus") {
          SavedQuestionListView()
        }
        
        Tab("전체 문제", systemImage: "calendar") {
          EntireQuestionsView()
        }
        
      }
      .tint(.accentGreen)
    }
        
    }
  
  init() {
    UITabBar.appearance().backgroundColor = UIColor.white
  }
}

#Preview {
    ContentView()
}


