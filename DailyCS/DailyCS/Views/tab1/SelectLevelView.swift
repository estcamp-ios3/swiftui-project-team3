//
//  SelectLevelView.swift
//  DailyCS
//
//  Created by home on 7/4/25.
//

import SwiftUI

/// TodayCS - front - SelectLevelView
/// 난이도 선택화면
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
                        
                            Button(action: { difficultyLevel = 1}) {
                                Text("Easy")
                                    .bold()
                                    .foregroundColor(difficultyLevel == 1 ? Color.yellow : Color.white)
                                    .modifier(CustomButtonStyle(color: .correctGreen))
                            }
                            .border(Color.yellow, width : difficultyLevel == 1 ? 5 : 0)
                            .cornerRadius(5)
                            
                            Button(action: { difficultyLevel = 2}) {
                                Text("Normal")
                                    .bold()
                                    .foregroundColor(difficultyLevel == 2 ? Color.yellow : Color.white)
                                    .modifier(CustomButtonStyle(color: .correctGreen))
                            }
                            .border(Color.yellow, width : difficultyLevel == 2 ? 5 : 0)
                            .cornerRadius(5)
                            
                            Button(action: { difficultyLevel = 3 }) {
                                Text("Hard")
                                    .bold()
                                    .foregroundColor(difficultyLevel == 3 ? Color.yellow : Color.white)
                                    .modifier(CustomButtonStyle(color: .correctGreen))
                            }
                            .border(Color.yellow, width : difficultyLevel == 3 ? 5 : 0)
                            .cornerRadius(5)
                            
                        
                        
                        Spacer()
                        
//                        Text("현재 난이도 : " + printLevel())
                        
                        Spacer()
                        
                            Button(action: {
                            // 레벨은 받아서 수정
                            csDataManager.fetchCSQuestion(level: difficultyLevel)
                            }) {
                                Text("시작하기").modifier(CustomButtonStyle(color: .correctGreen))
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
       
        default:
            "난이도를 선택해주세요."
        }
    }
}

#Preview {
    SelectLevelView()
}
