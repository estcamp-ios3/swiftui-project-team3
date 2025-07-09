//  SavedQuestionView.swift
//  DailyCS
//
//  Created by 송서윤 on 7/4/25.
//

import SwiftUI
import _SwiftData_SwiftUI


struct SavedQuestionListView: View {
  
  @Query(sort: \QuestionDataForSave.id) var savedQuestions: [QuestionDataForSave]
  @Environment(\.modelContext) private var modelContext 
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
        
        VStack {
          
          HStack {
            Button("전체") {
              selectedLevel = nil
            }
            .buttonStyle(.borderedProminent)
            .tint(selectedLevel == nil ? .correctGreen : .gray)
            .font(.title)
            
            ForEach(allLevels) { levelName in
              Button(levelName.description) {
                selectedLevel = levelName.rawValue
              }
              .buttonStyle(.borderedProminent)
              .tint(selectedLevel == levelName.rawValue ? .correctGreen : .gray)
              .font(.title)
            }
          }
          
          // 저장된 문제가 없는 경우
          if filteredQuestions.isEmpty {
            Spacer()
            
            Text("저장한 문제가 없습니다")
              .font(.title3)
              .foregroundStyle(.gray)
            
            Spacer()
          } else {
            // 저장된 문제가 있는 경우
            List {
              ForEach(filteredQuestions) { question in
                
                  HStack {
                    Spacer()
                    NavigationLink(destination: SavedQuestionDetailView(question: question)) {
                      VStack(alignment: .leading, spacing: 8) {
                        // 문제의 레벨
                        Text(LevelName(rawValue: question.level)?.description ?? "\(question.level)")
                          .font(.caption)
                          .foregroundColor(.darkGrayText)
                        
                        // 문제 내용
                        Text(question.question)
                          .font(.headline)
                      }
                    
                  }
                }
                .padding()
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.white)
                .cornerRadius(10)
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
      .navigationBarTitle("저장된 문제 리스트")
      .navigationBarTitleDisplayMode(.large)
    }
  }
}


#Preview {
  NavigationStack{
    SavedQuestionListView()
  }
}
