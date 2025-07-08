//
//  QuestionResultView.swift
//  DailyCS
//
//  Created by Rental pc on 7/4/25.
//

import SwiftUI

struct QuestionResultView: View {
    //    @State private var moveToSelectLevelView = false
    var questionDatas: [QuestionData1] = []
    var yourAnswers: [Int] = []

    @State private var path = NavigationPath()
    
    func test(){
        var questionArray: [QuestionData1] = []
        
        for (question, answer) in zip(questionDatas, yourAnswers) {
            print("질문: \(question), 당신의 답변: \(answer)")
            if question.answer_number != answer {
                questionArray.append(question)
                
            }
        }
    

        _ = 100 - (questionArray.count * 20)
        
        // 리스트 출력


        
    }
    
    var body: some View {
        NavigationStack(path:$path) {
            
            ZStack {
                Color.veryLightGreenBackground.edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 16) {
                    
                    HStack {
                        Button(action: {
                            // 닫기 액션
                            path.append("SelectLevel")
                            //      moveToSelectLevelView = true
                        }) {
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
                        
                        Text("\(_=100 - (questionDatas.count * 20))점 (\(questionDatas.count)문제 중 \(questionDatas.count - yourAnswers.filter({$0 != 0}).count)문제 틀림)")
                            .font(.title2)
                            .bold()
                        
                    }
                    
                    .padding()
                    
                    // 더미 데이터
                    Text("틀린 문제 리스트")
                        .font(.title2)
                        .fontWeight(.medium)
                        .foregroundColor(.red)
                        .tint(.black)
                    List(questionDummyDatas) {data in HStack {
                        //
                        Text(data.question)

                    }


                    }
                }


            }
            .padding(.horizontal, 20)
            .navigationDestination(for: String.self) { destination in
                if destination == "SelectLevel" {
                    SelectLevelView()
                }
                //                    .navigationDestination(isPresented: $moveToSelectLevelView, destination: {
                //                        SelectLevelView()
                //                    })
                
            }
            .navigationBarBackButtonHidden(true) // Back 버튼 없애기
        }
    }
}

struct QuestionResultView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionResultView()
    }
}
