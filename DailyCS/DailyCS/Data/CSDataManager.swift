//
//  CSDataManager.swift
//  DailyCS
//
//  Created by 최용헌 on 7/4/25.
//

import Foundation
import Supabase
import SwiftData


/// 서버의 함수로 넘겨줄 파라미터
struct QuestionRequestParams: Encodable {
  let p_level: Int
  let p_limit: Int
}


///  CS질문 네트워크 매니져
class CSDataManager: ObservableObject {
  static let shared = CSDataManager()
  
  @Published var questions: [QuestionData1] = []
  @Published var isLoaded: Bool = false
  
  /// CS관련 질문들 가져오기
  /// - Parameters:
  ///   - level: 질문의 레벨
  ///   - limit: 질문의 갯수
  func fetchCSQuestion(level: Int = 0, limit: Int = 5) {
    Task {
      do {
        // 서버에 저장된 함수에 파라미터로 가져올 문제의 레벨, 갯수 넘겨주기
        let params = QuestionRequestParams(p_level: level, p_limit: limit)
        
        // 서버에서 데이터 랜덤하게 가져오기
        let data = try await supabase
          .rpc("get_random_questions", params: params)
          .execute()
          .data
      
        // 디코딩하기
        let questions = try JSONDecoder().decode([QuestionDataDTO].self, from: data)

        let convertedQuestions = questions.map { QuestionData1(with: $0) }
        
        print(convertedQuestions)
        DispatchQueue.main.async {
          self.questions = convertedQuestions
          self.isLoaded = true
          
        }
    
      } catch {
        print("err", error)
        
      }
    }
  }
  
  
  /// CS 질문 가져오기 (페이징 처리)
  /// - Parameter level: 가져올 레벨
  func fetchCSQuestionWithPaging(level: Int = 0) {
    Task {
      do{
        let data = try await supabase
          .from("questions")
          .select()
          .eq("level", value: level)
          .range(from: 0, to: 9)
          .execute()
          .data
                  
        let questions = try JSONDecoder().decode([QuestionDataDTO].self, from: data)
        print(questions)
        
      }catch{
        print("실패 \(error)")
      }
    }
  }
   
  
  /// 질문 저장하기
  /// - Parameters:
  ///   - question: 저장할 질문
  func saveQuestion(_ modelContext: ModelContext, question: QuestionData1) {
    let saveQuestion: QuestionDataForSave = QuestionDataForSave(with: question)
    
    modelContext.insert(saveQuestion)
    
    do {
      try modelContext.save()
    }catch{
      print("질문 저장에 실패했어요.\(error)")
    }
  }
  
  
  /// 로컬에서 질문 가져오기
  func fetchQuestions(_ modelContext: ModelContext) -> [QuestionDataForSave]? {
    let descriptor = FetchDescriptor<QuestionDataForSave>()
    
    return (try? modelContext.fetch(descriptor))
  }
  
  
  /// 저장된 질문 삭제하기
  /// - Parameters:
  ///   - data: 삭제할 질문
  func deleteQuestion(_ modelContext: ModelContext, data: QuestionDataForSave) {
    modelContext.delete(data)
    do {
      try modelContext.save()
    }catch{
      print("질문 삭제에 실패했어요.\(error)")
    }
  }

  
}

