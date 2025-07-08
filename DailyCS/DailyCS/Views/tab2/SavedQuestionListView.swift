
//  SavedQuestionView.swift
//  DailyCS
//
//  Created by 송서윤 on 7/4/25.
//

import SwiftUI
import _SwiftData_SwiftUI

struct SavedQuestionListView: View {
    
    @Query(sort: \QuestionDataForSave.id) var savedQuestions: [QuestionDataForSave]
    @Environment(\.modelContext) private var modelContext //
    private let csDataManager = CSDataManager() //
    @State private var selectedLevel: Int? = nil
    
    //    private var allLevels: [Int] {
    //        Array(Set(savedQuestions.map { $0.level })).sorted()
    //    }
    private var allLevels: [Int] {
        Array(Set(questionDummyDatas.map { $0.level })).sorted()
    }
    
    
    private var filteredQuestions: [QuestionDataForSave] {
        if let level = selectedLevel {
            return savedQuestions.filter { $0.level == level }
        } else {
            return savedQuestions.sorted(by: { $0.level < $1.level })
        }
    }
    @AppStorage("hasLoadedInitialSavedQuestions") private var hasLoadedInitialSavedQuestions: Bool = false
    
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
                        HStack(spacing: 17) {
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
                    
                    if filteredQuestions.isEmpty {
                        Spacer()
                        Text("저장한 문제가 없습니다.")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        Spacer()
                    } else {
                        
                        List {
                            ForEach(filteredQuestions/*, id: \.id*/) { question in
                                NavigationLink {
                                    SavedQuestionDetailView(question: question)
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
                        .listStyle(.automatic)
                        .scrollContentBackground(.hidden)
                        .background(Color.veryLightGreenBackground)
                    }
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
