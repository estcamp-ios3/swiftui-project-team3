//
//  SavedQuestionDetailView.swift
//  DailyCS
//
//  Created by 송서윤 on 7/4/25.
//

import SwiftUI

struct SavedQuestionDetailView: View {
    
    @Binding var question: QuestionData
    
    private func getAnswerText(for data: QuestionData) -> String {
        switch data.answer_number {
        case 0: return data.answer1
        case 1: return data.answer2
        case 2: return data.answer3
        case 3: return data.answer4
        default: return ""
        }
    }
    
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
                
                Text(question.question)
                    .font(.system(size: 20))
                    .bold()
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                if !showAnswer {
                    Button("정답보기") {
                        withAnimation {
                            showAnswer = true
                        }
                    }
                    .font(.title)
                    .buttonStyle(.borderedProminent)
                    .tint(.correctGreen)
                    .padding(.top, 20)
                } else {
                    Text(getAnswerText(for: question))
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
                            .padding(.trailing, 10)
                    }
                }
            }
            .alert("나만의 노트에서 삭제할까요?", isPresented: $showDelete) {
                Button("취소하기", role: .cancel) {
                }
                Button("삭제하기", role: .destructive) {
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
    @Previewable @State var previewQuestions: [QuestionData] = questionDummyDatas
    NavigationStack {
        SavedQuestionDetailView(question: $previewQuestions[0], allQuestions: $previewQuestions)
    }
}
