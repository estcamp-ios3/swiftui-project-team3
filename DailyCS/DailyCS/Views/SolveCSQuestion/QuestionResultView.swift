//
//  QuestionResultView.swift
//  DailyCS
//
//  Created by Rental pc on 7/4/25.
//

import SwiftUI


/// TodayCS - front - QuestionResultView
/// 문제풀이 결과 화면
struct QuestionResultView: View {
    
    // 문제 배열
    var questionDatas: [QuestionData1] = []
    // 답 1~4번 중 선택
    var yourAnswers: [Int] = []
    // 선택한 답에 대한 텍스트
    var selectedAnswerArray: [String] = []
    // 맞춘 개수
    @State var correctCount = 0 // 맞춘 개수 카운트
    // 틀린 문제 모아두기
    @State var wrongQuestionArray: [QuestionData1] = []
    
    @State var score: Int = 0
    
    func questionAnswers(){
        
        //초기화
        correctCount = 0
        wrongQuestionArray = []
        // 예제
        for (question, answer) in zip(questionDatas, yourAnswers) {
            print("질문: \(question.answer_number), 당신의 답변: \(answer)")
            if question.answer_number == answer {
                correctCount += 1
            }else {
                wrongQuestionArray.append(question)
            }
            
        }
        // 점수
        score = correctCount * 20
    }
    
    var body: some View {
        
        ZStack {
            // 배경
            Color.veryLightGreenBackground.ignoresSafeArea()
            
            
            VStack(spacing: 16) {
                
                HStack {
                    NavigationLink(destination: SelectLevelView())
                    {
                        Image(systemName: "xmark")
                            .font(.title)
                            .padding()
                    }
                    Spacer()
                    
                }
                
                // 오늘의 점수
                VStack(spacing: 20) {
                    Text("오늘의 점수").foregroundColor(.green)
                        .font(.largeTitle)
                    
                    // 맞힌 점수
                    Text("총 \(score)점")
                        .font(.title2)
                        .bold()
                    
                }
                
                .padding()
                
                // 더미 데이터
                Text("틀린 문제 리스트")
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.red)
                
                // 틀린 문제 배열
                List {
                    ForEach(wrongQuestionArray) { array in
                        NavigationLink {
                            WrongQuestionView(questionData1: array)
                            
                        }label: {
                            VStack(alignment: .leading) {
                                
                                Text(array.question)
                                    .font(.headline)
                            }
                            .padding()
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .background(Color.white)
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.1), radius: 3, x: 0, y: 2)
                        }
                    }
                }
            }
            .scrollContentBackground(.hidden)
            .background(Color.clear)
            .padding()
            
        }
        .navigationBarBackButtonHidden(true) // Back 버튼 없애기
        .onAppear() {
            questionAnswers()
        }
    }
    
}


struct QuestionResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionResultView()
    }
}
