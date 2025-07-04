//
//  QuestionResultView.swift
//  DailyCS
//
//  Created by Rental pc on 7/4/25.
//

import SwiftUI


struct QuestionResultView: View {
    @State var listname: String = ""
    var body: some View {
        
        ScrollView{
            
            Spacer(minLength: 30)
            
            Text("오늘의 점수")
                .font(.largeTitle)
            Text("65 / 100")
                .font(.largeTitle)
                .padding()
            
            Spacer(minLength: 40)
            
            Text("틀린문제 리스트")
                .font(.largeTitle)
            
            Spacer(minLength: 30)
            Text("1")
                .font(.largeTitle)
            
        }
        
    }
}
#Preview {
    QuestionResultView()
}
