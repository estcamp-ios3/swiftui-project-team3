//
//  ContentView.swift
//  DailyCS
//
//  Created by 최용헌 on 7/4/25.
//

import SwiftUI

 
struct ContentView: View {
//    let dataManager = CSDataManager()
    var body: some View {
        
        
        TabView {
            Tab("메인", systemImage: "house") {
                SelectLevelView()
            }
            
            Tab("저장", systemImage: "note.text.badge.plus") {
                SavedQuestionListView()
            }
            
            Tab("점수", systemImage: "calendar") {
              EntireQuestionsView()
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}


