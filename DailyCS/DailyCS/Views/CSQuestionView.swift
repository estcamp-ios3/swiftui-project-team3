//
//  CSQuestionView.swift
//  DailyCS
//
//  Created by home on 7/4/25.
//

import SwiftUI

struct CSQuestionView: View {
    
    var difficultyLevel: Int = 1
    
    var questionData: QuestionData = QuestionData(id: 1, level: 1, question: "문제 내용", answerList: ["a", "b", "c", "d"], answerNumber: 1)
    
    var body: some View {
        VStack {
            
            Text(questionData.question)
                .font(.headline)
            
            List(questionData.answerList, id: \.self) { item in
                Text(item)
            }
            
            NavigationLink(destination:CSQuestionView()) {
                Text("다음 문제")
            }
        }
    }
    
}

#Preview {
    CSQuestionView()
}
