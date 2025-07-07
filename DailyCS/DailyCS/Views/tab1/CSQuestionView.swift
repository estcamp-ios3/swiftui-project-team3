//
//  CSQuestionView.swift
//  DailyCS
//
//  Created by home on 7/4/25.
//

import SwiftUI




struct CSQuestionView: View {
//<<<<<<< HEAD
    
    @State var yourAnswer: Int = 0
    @State var ChosenQuestion: Int = 0
    var difficultyLevel: Int = 1
    
    var questionDatas = questionDummyDatas.shuffled().prefix(5)
    @State var yourAnswers: [Int] = Array(repeating: 0, count: 5)
    

    var body: some View {
        VStack {
//=======
//  @Environment(\.modelContext) private var modelContext
//
//  var difficultyLevel: Int = 1
//  
//  var questionData: DummyQuestionData = DummyQuestionData(id: 1, level: 1, questionText: "문제 내용", answerList: ["a", "b", "c", "d"], answerNumber: 1)
//  
//  var body: some View {
//    VStack {
//      
//      VStack(alignment: .leading) {
//        
//        Text(questionData.questionText)
//          .font(.headline)
//        
//        List(questionData.answerList, id: \.self) { item in
//          
//          Button(item){
//>>>>>>> 31818f2274bbf2c00b4a1515d7c26f2365c409ab
            
            VStack(alignment: .leading) {
                
                Text(questionDatas[ChosenQuestion].question)
                    .font(.headline)
                
                List {
                    
                    Button(action: {
                        yourAnswer = 1
                        }
                    ) {
                        Text("1. " + questionDatas[ChosenQuestion].answers(index: 1))
                    }
                    
                    Button(action: {
                        yourAnswer = 2
                    }
                    ) {
                        Text("2. " + questionDatas[ChosenQuestion].answers(index: 2))
                    }
                    
                    Button(action: {
                        yourAnswer = 3
                    }
                    ) {
                        Text("3. " + questionDatas[ChosenQuestion].answers(index: 3))
                    }
                    
                    Button(action: {
                        yourAnswer = 4
                    })
                    {
                        Text("4. " + questionDatas[ChosenQuestion].answers(index: 4))
                    }
                }
                if yourAnswer != 0 {
                    Text("Your answer: \(yourAnswer). \(questionDatas[ChosenQuestion].answers(index: yourAnswer))")
                }
            }
            
        }.padding(30)
        
        if ChosenQuestion < questionDatas.count - 1 {
            Button(action:{
                yourAnswer = 0
                ChosenQuestion += 1
            }) {
                Text("다음 문제")
                    .frame(width: 200, height: 50)
                    .background(Color.mainGreen)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }
        }
        else{
            
            NavigationLink(destination: QuestionResultView()) {
                    Text("다 풀었어요~")
            }
        }
    }
//<<<<<<< HEAD
//=======
//  }
//  
//  /// 질문 로컬에 저장하기
//  func saveQuestion(question: QuestionData){
//    let saveQeustion = QuestionDataForSave(with: question)
//    
//    modelContext.insert(saveQeustion)
//  }
//>>>>>>> 31818f2274bbf2c00b4a1515d7c26f2365c409ab
}
  
  #Preview {
    CSQuestionView()
  }
