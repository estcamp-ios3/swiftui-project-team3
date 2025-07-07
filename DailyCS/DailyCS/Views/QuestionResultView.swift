//
//  QuestionResultView.swift
//  DailyCS
//
//  Created by Rental pc on 7/4/25.
//

import SwiftUI

struct QuestionResultView: View {
    @State private var moveToSelectLevelView = false
    
    var body: some View {
    
            NavigationStack {
                
                VStack(spacing: 16) {
                    // ① 닫기 버튼
                    HStack {
                        Button(action: {
                            // 닫기 액션
                            moveToSelectLevelView = true
                        }) {
                            Image(systemName: "xmark")
                                .font(.title)
                                .padding()
                        }
                        Spacer()
                    }
                    
                    // ② 오늘의 점수
                    VStack(spacing: 8) {
                        Text("오늘의 점수")
                            .font(.headline)
                        Text("60 / 100")
                            .font(.title)
                            .bold()
                    }
                    .padding()
                    
                    // ③ 틀린 문제 리스트
                    VStack(alignment: .leading, spacing: 8) {
                        Text("틀린문제 리스트")
                            .font(.headline)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(8)
                        Spacer()
                            .padding(.horizontal)
                        
                        ForEach(1...5, id: \.self) { idx in
                            HStack(alignment: .top, spacing: 12) {
                                
                                Text("\(idx)")
                                    .frame(width: 30, height: 120)
                                    .background(Color.gray)
                                    .foregroundColor(.white)
                                    .cornerRadius(4)
                                    .padding(.top, 4)
                                
                                VStack(alignment: .leading, spacing: 8){
                                    
                                    Text("문제 내용")
                                        .padding(6)
                                        .background(Color.gray)
                                        .opacity(0.7)
                                        .foregroundColor(.white)
                                        .cornerRadius(4)
                                    
                                    Text("선택한 답안 내용")
                                        .padding(6)
                                        .background(Color.orange)
                                        .foregroundColor(.white)
                                        .cornerRadius(4)
                                    Text("정답 내용")
                                        .padding(4)
                                        .background(Color.green)
                                        .foregroundColor(.white)
                                        .cornerRadius(4)
                                    
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(12)
                            .padding(.horizontal)
                        
                    }
                    
                }
                .padding()
                .navigationDestination(isPresented: $moveToSelectLevelView) {
                    SelectLevelView()
                }
            }
        }

}

struct QuestionResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionResultView()
    }
}
