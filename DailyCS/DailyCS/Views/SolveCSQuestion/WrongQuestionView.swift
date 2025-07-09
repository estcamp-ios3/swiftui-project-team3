//
//  WrongQuestionView.swift
//  DailyCS
//
//  Created by Rental pc on 7/9/25.
//

import SwiftUI
import SwiftData

struct WrongQuestionView: View {
    
    // 문제 저장 버튼 구현용 csDataManager 및 bool 변수, 경고문구 선언
    @StateObject private var csDataManager = CSDataManager.shared
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \QuestionDataForSave.id) var savedQuestions: [QuestionDataForSave]
    @State var isSaved: Bool = false
    @State var alertMessage = ""
    let questionData1 : QuestionData1
    var savedQuestionIDs: [Int] {
      return savedQuestions.map { $0.id }
    }
    
    
    var body: some View {
        VStack {
            
            ZStack {
                Color.veryLightGreenBackground
                    .ignoresSafeArea()
                
                VStack(spacing: 24) {
                
                    
                    Text(questionData1.question)
                        .font(.system(size: 20))
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 16)
                        
                    
                    VStack(alignment: .leading, spacing: 12) {
                        
                        
                        Text("① \(questionData1.answer1)")
                            .font(.headline)
                        
                        Text("② \(questionData1.answer2)")
                            .font(.headline)
                        
                        
                        Text("③ \(questionData1.answer3)")
                            .font(.headline)
                        
                        
                        Text("④ \(questionData1.answer4)")
                            .font(.headline)
                        
                        
                        Text("정답: \(questionData1.answer_number) 번")
                            .font(.body)
                            .fontWeight(.bold)
                            .padding(.top ,8)
                    }
                    .padding()
                    
                    Spacer()
                }
                .frame(maxHeight: .infinity ,alignment: .top)
                .padding(.top, 20)
            }
                }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing){
                Button(action : {
                  // 이미 저장된 경우 - 저장 x
                  if savedQuestionIDs.contains(where: { $0 == questionData1.id }) {
                    print("이미 저장됨")
                    alertMessage = "이미 저장된 문제입니다."
                  }else {
                    // 저장된 목록에 없는 경우 - 저장
                    csDataManager.saveQuestion(modelContext, question: questionData1)
                    alertMessage = "문제가 저장되었습니다."
                  }
                  isSaved = true
                }) {
                    Image(systemName: "square.and.arrow.down.on.square.fill")
                }.alert(alertMessage, isPresented: $isSaved) {
                  Button("확인", role: .cancel) {}
                }
            }
        }

            }
            
        }
//#Preview {
//            
//    WrongQuestionView()
//                      
//
//        }
