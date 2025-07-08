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
    private let csDataManager = CSDataManager.shared
    @State private var selectedLevel: Int? = nil
    
    private var allLevels: [LevelName] {
        LevelName.allCases.sorted(by: { $0.rawValue < $1.rawValue })
    }
    
    
    private var filteredQuestions: [QuestionDataForSave] {
        if let levelRawValue = selectedLevel {
            return savedQuestions.filter { $0.level == levelRawValue }
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
                    
                    HStack(spacing: 26) {
                        Button("전체") {
                            selectedLevel = nil
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(selectedLevel == nil ? .correctGreen : .gray)
                        .font(.headline)
                        
                        ForEach(allLevels) { levelName in
                            Button(levelName.description) {
                                selectedLevel = levelName.rawValue
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(selectedLevel == levelName.rawValue ? .correctGreen : .gray)
                            .font(.headline)
                        }
                    }
                    .padding(.horizontal, 10)
                    
                    if filteredQuestions.isEmpty {
                        Spacer()
                        Text("저장한 문제가 없습니다")
                            .font(.title2)
                            .foregroundStyle(.gray)
                        Spacer()
                    } else {
                        
                        List {
                            ForEach(filteredQuestions) { question in
                                NavigationLink {
                                    SavedQuestionDetailView(question: question)
                                } label: {
                                    VStack(alignment: .leading) {
                                        Text(LevelName(rawValue: question.level)?.description ?? "\(question.level)")
                                            .font(.caption)
                                            .foregroundColor(.gray)
                                        Text(question.question)
                                            .font(.headline)
                                    }
                                    .padding()
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .background(Color.white)
                                    .cornerRadius(10)
                                    .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
                                }
                                .listRowSeparator(.hidden)
                                .listRowBackground(Color.veryLightGreenBackground)
                                .listRowInsets(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
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
