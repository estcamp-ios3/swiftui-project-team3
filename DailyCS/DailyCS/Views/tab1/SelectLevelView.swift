//
//  SelectLevelView.swift
//  DailyCS
//
//  Created by home on 7/4/25.
//

import SwiftUI

struct SelectLevelView: View {
  @StateObject private var csDataManager: CSDataManager = CSDataManager.shared
  
    @State var difficultyLevel: Int = 1
        var body: some View {
            
                NavigationStack{
                    ZStack{
                        Color.veryLightGreenBackground.ignoresSafeArea()
                    
                        VStack {
                            Spacer()
                            Spacer()
                            
                            Text("난이도 선택").font(.largeTitle).bold(true)
                            .padding(.bottom, 50)
                        
                        
                            Button("Easy") {
                                difficultyLevel = 1
                            }
                            .foregroundColor(difficultyLevel == 1 ? Color.yellow : Color.white)
                            .modifier(LevelButtonStyle(color: .correctGreen))
                            
                            
                            Button("Normal") {
                                difficultyLevel = 2
                            }
                            .foregroundColor(difficultyLevel == 2 ? Color.yellow : Color.white)
                            .modifier(LevelButtonStyle(color: .correctGreen))
                            
                            Button("Hard") {
                                difficultyLevel = 3
                            }
                            .foregroundColor(difficultyLevel == 3 ? Color.yellow : Color.white)
                            .modifier(LevelButtonStyle(color: .correctGreen))
                            
                        
                        
                        Spacer()
                        
                        Text("현재 난이도 : " + printLevel())
                        
                        Spacer()
                        
                          Button("시작하기") {
                            // 레벨은 받아서 수정
                            csDataManager.fetchCSQuestion(level: difficultyLevel)
                          }
                          
                          NavigationLink(destination: CSQuestionView(difficultyLevel: difficultyLevel,
                                                                     questionDatas: $csDataManager.questions),
                                         isActive: $csDataManager.isLoaded) {
                          EmptyView()
                    
                        }
                        
                        Spacer()
                        }.font(.title)
                            .padding()
                }
        }
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
