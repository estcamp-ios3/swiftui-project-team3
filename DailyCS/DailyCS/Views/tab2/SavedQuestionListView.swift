//
//  SavedQuestionView.swift
//  DailyCS
//
//  Created by 송서윤 on 7/4/25.
//

import SwiftUI

struct SavedQuestionListView: View {
    
    @State private var savedQuestions: [QuestionData] = questions
    private var allLevels: [Int] {
        Array(Set(savedQuestions.map { $0.level })).sorted()
    }
    @State private var selectedLevel: Int? = nil
    private var filteredQuestions: [QuestionData] {
        if let level = selectedLevel {
            return savedQuestions.filter { $0.level == level }
        } else {
            return questions
        }
    }
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                Color.veryLightGreenBackground
                    .ignoresSafeArea()
                
                VStack {
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            Button("전체") {
                                selectedLevel = nil
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(.correctGreen)
                            .font(.headline)
                            
                            ForEach(allLevels, id: \.self) { level in
                                Button("Level \(level)"){
                                    selectedLevel = level
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(.correctGreen)
                                .font(.headline)
                            }
                        }
                        .padding(.horizontal, 10)
                    }
                    .padding(.bottom, 10)
                    
                    List {
                        ForEach(filteredQuestions) { question in
                            NavigationLink {
                                SavedQuestionDetailView(question: question, allQuestions: $savedQuestions)
                            } label: {
                                VStack(alignment: .leading) {
                                    Text("Level \(question.level)")
                                        .font(.caption)
                                        .foregroundColor(.gray)
                                    Text(question.questionText)
                                        .font(.headline)
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
    }
}

#Preview {
    NavigationStack{
        SavedQuestionListView()
    }
}
