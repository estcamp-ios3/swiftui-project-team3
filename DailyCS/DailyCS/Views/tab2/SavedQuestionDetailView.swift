//  SavedQuestionDetailView.swift
//  DailyCS
//
//  Created by 송서윤 on 7/4/25.
//

import SwiftUI
import SwiftData

struct SavedQuestionDetailView: View {
    
    @Bindable var question: QuestionDataForSave
    
    
    @State private var showAnswer = false
    @State private var showDelete = false
    @State private var showDeletedAlert = false
    
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
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
                    Text(question.answer)
                        .font(.title)
                        .bold()
                        .padding(.vertical)
                        .transition(.opacity)
                }
                    Spacer()
            }
                .navigationTitle("문제 상세(\(LevelName(rawValue: question.level)?.description ?? "\(question.level)"))")
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
                    modelContext.delete(question)
                    try? modelContext.save()
                        showDeletedAlert = true
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


//#Preview {
//    NavigationStack {
//            SavedQuestionDetailView(question: previewQuestion)
//        }
//}

