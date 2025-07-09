//
//  WrongQuestionView.swift
//  DailyCS
//
//  Created by Rental pc on 7/9/25.
//

import SwiftUI

struct WrongQuestionView: View {
    
    let questionData1 : QuestionData1
    
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
            }
            
        }
//#Preview {
//            
//    WrongQuestionView()
//                      
//
//        }
