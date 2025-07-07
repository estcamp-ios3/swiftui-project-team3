//
//  SavedQuestionView.swift
//  DailyCS
//
//  Created by 송서윤 on 7/4/25.
//

import SwiftUI

struct SavedQuestionListView: View {
    
    @State private var savedQuestions: [QuestionData] = questionDummyDatas
    private var allLevels: [Int] {
        Array(Set(savedQuestions.map { $0.level })).sorted()
    }
    @State private var selectedLevel: Int? = nil
    private var filteredQuestions: [QuestionData] {
        if let level = selectedLevel {
            return savedQuestions.filter { $0.level == level }
        } else {
            return savedQuestions
        }
    }
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                Color.veryLightGreenBackground
                    .ignoresSafeArea()
                    
                VStack(spacing: 0) {
                    
                    Text("저장한 문제 리스트")
                        .font(.largeTitle)
                        .bold()
                        .padding()
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            Button("전체") {
                                selectedLevel = nil
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(selectedLevel == nil ? .correctGreen : .gray)
                            .font(.headline)
                            
                            ForEach(allLevels, id: \.self) { level in
                                Button("Level \(level)"){
                                    selectedLevel = level
                                }
                                .buttonStyle(.borderedProminent)
                                .tint(selectedLevel == level ? .correctGreen : .gray)
                                .font(.headline)
                            }
                        }
                        .padding(.horizontal, 10)
                        .padding(.leading, 20)
                    }
                    
                    
                    List {
                        ForEach(filteredQuestions, id: \.id) { question in
                            if let index = savedQuestions.firstIndex(where: { $0.id == question.id }) {
                                NavigationLink {
                                    SavedQuestionDetailView(question: $savedQuestions[index], allQuestions: $savedQuestions)
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text("Level \(question.level)")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        Text(question.question)
                                            .font(.headline)
                                    }
                                }
                            }
                        }
                    }
//                    .navigationTitle(Text("저장한 문제 리스트"))
                    .listStyle(.automatic)
                    .scrollContentBackground(.hidden)
                    .background(Color.veryLightGreenBackground)
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
