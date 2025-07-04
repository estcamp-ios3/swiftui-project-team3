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
        
        Button("쉬움") {
            difficultyLevel = 1
        }
        .padding()
        .font(.title)
        .frame(width: 200, height: 50)
        .background(Color.mainGreen)
        .foregroundColor(.white)
        .cornerRadius(20)
        
        Button("보통") {
            difficultyLevel = 2
        }
        .padding()
        .font(.title)
        .frame(width: 200, height: 50)
        .background(Color.mainGreen)
        .foregroundColor(.white)
        .cornerRadius(20)
        
        Button("어려움") {
            difficultyLevel = 3
        }
        .padding()
        .font(.title)
        .frame(width: 200, height: 50)
        .background(Color.mainGreen)
        .foregroundColor(.white)
        .cornerRadius(20)
        
        Spacer()
        
        Text("현재 난이도 : " + printLevel())
        
        Spacer()
        
        NavigationLink(destination: CSQuestionView(difficultyLevel: difficultyLevel)) {
            Text("시작하기")
                .padding()
                .font(.title)
                .frame(width: 200, height: 50)
                .background(Color.mainGreen)
                .foregroundColor(.white)
                .cornerRadius(20)
        }
    
        Spacer()
        
}

    func printLevel() -> String {
        switch difficultyLevel {
        case 1:
            "쉬움"
        case 2:
            "보통"
        case 3:
            "어려움"
        default:
            "난이도를 선택해주세요."
        }
    }
}

#Preview {
    SelectLevelView()
}
