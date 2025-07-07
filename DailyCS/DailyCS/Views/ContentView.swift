//
//  ContentView.swift
//  DailyCS
//
//  Created by 최용헌 on 7/4/25.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        TabView {
            Tab("메인", systemImage: "house") {
                CSQuestionView()
            }
            
            // level1, 2, 3버튼이 있는 view를 만들어 그 뷰안에서 보여주는게 나을지도
            Tab("저장", systemImage: "note.text.badge.plus") {
                SavedQuestionListView()
              Text("1")
            }

            Tab("점수", systemImage: "calendar") {
                QuestionResultView()
            }

        }
    }
}

#Preview {
    ContentView()
}


