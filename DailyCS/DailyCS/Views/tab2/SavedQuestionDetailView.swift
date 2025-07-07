//
//  SavedQuestionDetailView.swift
//  DailyCS
//
//  Created by 송서윤 on 7/4/25.
//

import SwiftUI

struct SavedQuestionDetailView: View {
    
    let question: QuestionData
    @Binding var allQuestions: [QuestionData]
    @State private var showAnswer = false
    @State private var showDelete = false
    @State private var showDeletedAlert = false
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            
            ZStack {
                Color.veryLightGreenBackground
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    Spacer()
                
                Text(question.questionText)
                    .font(.headline)
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                if !showAnswer {
                    Button("정답보기") {
                        withAnimation {
                            showAnswer = true
                        }
                    }
                    .font(.title2)
                    .buttonStyle(.borderedProminent)
                    .tint(.correctGreen)
                    .padding(.top, 20)
                } else {
                    Text("\(question.answerList[question.answerNumber])")
                        .font(.title2)
                        .padding(.vertical)
                        .transition(.opacity)
                }
                    Spacer()
            }
                .navigationTitle("문제 상세 (Level \(question.level))")
                .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing){
                    Button {
                        showDelete = true
                    } label: {
                        Image(systemName: "trash")
                            .foregroundColor(.red)
                    }
                }
            }
            .alert("나만의 노트에서 삭제할까요?", isPresented: $showDelete) {
                Button("취소하기", role: .cancel) {
                }
                Button("삭제하기", role: .destructive) {
                    // 삭제 기능
                    if let index = allQuestions.firstIndex(where: { $0.id == question.id }) {
                        allQuestions.remove(at: index)
                        showDeletedAlert = true
                    }
                }
            }
            .alert("나만의 노트에서 삭제했어요", isPresented: $showDeletedAlert) {
                Button("확인", role: .cancel) {
                    dismiss()
                }
            }
        }
    }
}


#Preview {
    @Previewable @State var previewQuestions: [QuestionData] = questions
    NavigationStack {
        SavedQuestionDetailView(question: questions[0], allQuestions: $previewQuestions)
    }
}
