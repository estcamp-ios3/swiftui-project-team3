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
                            
                        
                        
                        Spacer()
                        
                        Text("현재 난이도 : " + printLevel())
                        
                        Spacer()
                        
                          Button("시작하기") {
                            // 레벨은 받아서 수정
                            csDataManager.fetchCSQuestion(level: 0)
                          }
                          
                          NavigationLink(destination: CSQuestionView(difficultyLevel: difficultyLevel,
                                                                     questionDatas: $csDataManager.questions),
                                         isActive: $csDataManager.isLoaded) {
                          EmptyView()
                    
                        }
                        
                        Spacer()
                        }.font(.title)
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
