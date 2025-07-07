//
//  SelectLevelView.swift
//  DailyCS
//
//  Created by home on 7/4/25.
//

import SwiftUI

struct SelectLevelView: View {
    
    @State var difficultyLevel: Int = 1
    
    var body: some View {
        
        Spacer()
        Spacer()
        
        Text("난이도 선택").font(.largeTitle).bold(true)
            .padding(.bottom, 50)
            
        VStack {
            Button("Easy") {
                difficultyLevel = 1
            }
            .padding()
            .frame(width: 200, height: 50)
            .background(Color.mainGreen)
            .foregroundColor(difficultyLevel == 1 ? .yellow :.white)
            .cornerRadius(20)
            
            
            Button("Normal") {
                difficultyLevel = 2
            }
            .padding()
            .frame(width: 200, height: 50)
            .background(Color.mainGreen)
            .foregroundColor(difficultyLevel == 2 ? .yellow :.white)
            .cornerRadius(20)
            
            Button("Hard") {
                difficultyLevel = 3
            }
            .padding()
            .frame(width: 200, height: 50)
            .background(Color.mainGreen)
            .foregroundColor(difficultyLevel == 3 ? .yellow :.white)
            .cornerRadius(20)
           
//            Button("4단계") {
//                difficultyLevel = 4
//            }
//            .padding()
//            .frame(width: 200, height: 50)
//            .background(Color.mainGreen)
//            .foregroundColor(difficultyLevel == 4 ? .yellow :.white)
//            .cornerRadius(20)
//            
//            Button("5단계") {
//                difficultyLevel = 5
//            }
//            .padding()
//            .frame(width: 200, height: 50)
//            .background(Color.mainGreen)
//            .foregroundColor(difficultyLevel == 5 ? .yellow :.white)
//            .cornerRadius(20)
//            
//            Button("6단계") {
//                difficultyLevel = 6
//            }
//            .padding()
//            .frame(width: 200, height: 50)
//            .background(Color.mainGreen)
//            .foregroundColor(difficultyLevel == 6 ? .yellow :.white)
//            .cornerRadius(20)            
        }.font(.title)
        
        Spacer()
        
        Text("현재 난이도 : " + printLevel())
        
        Spacer()
        
        NavigationLink(destination: CSQuestionView(difficultyLevel: difficultyLevel)) {
            Text("시작하기")
        }
    
        Spacer()
        
}

    func printLevel() -> String {
        switch difficultyLevel {
        case 1:
            "1단계 설명"
        case 2:
            "2단계 설명"
        case 3:
            "3단계 설명"
        case 4:
            "4단계 설명"
        case 5:
            "5단계 설명"
        case 6:
            "6단계 설명"
        default:
            "난이도를 선택해주세요."
        }
    }
}

#Preview {
    SelectLevelView()
}
