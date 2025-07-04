//
//  SavedQuestionView.swift
//  DailyCS
//
//  Created by 송서윤 on 7/4/25.
//

import SwiftUI

struct SavedQuestionListView: View {
    
    private var questionLevel: [Int: [QuestionData]] {
        Dictionary(grouping: questions, by: {$0.level})
    }
    private var sortedLevels: [Int] {
        questionLevel.keys.sorted()
    }
    
        var body: some View {
        
            NavigationStack {
                // level마다 리스트가 많아질수록 level2, 3내용을 보려면 계속 스크롤을 해야하니 세분화하는 버튼으로 만드는게 나을지도
                List {
                    ForEach(sortedLevels, id: \.self) { level in
                        Section(header: Text("Level \(level)")) {
                            ForEach(questionLevel[level] ?? []) { question in
                                NavigationLink {
                                    SavedQuestionDetailView(question: question)
                                } label: {
                                    Text(question.questionText)
                                        .font(.headline)
                                }
                            }
                        }
                    }
                }
                .navigationTitle(Text("저장한 문제 리스트"))
                .navigationBarTitleDisplayMode(.large)
                .listStyle(.plain)
            }
    }
}

#Preview {
    NavigationStack{
        SavedQuestionListView()
    }
}
