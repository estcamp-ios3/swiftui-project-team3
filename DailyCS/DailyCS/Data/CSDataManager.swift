//
//  CSDataManager.swift
//  DailyCS
//
//  Created by 최용헌 on 7/4/25.
//

import Foundation
import Supabase


/// 서버의 함수로 넘겨줄 파라미터
struct QuestionRequestParams: Encodable {
  let p_level: Int
  let p_limit: Int
}


///  CS질문 네트워크 매니져
class CSDataManager {

  
  /// CS관련 질문들 가져오기
  /// - Parameters:
  ///   - level: 질문의 레벨
  ///   - limit: 질문의 갯수
  func fetchCSQuestion(level: Int = 0, limit: Int = 5, completion: @escaping ([QuestionData]) -> Void) {
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
        let questions = try JSONDecoder().decode([QuestionData].self, from: data)

        
        completion(questions)
    
      } catch {
        print("err", error)
        
        completion([])
      }
    }
  }
}

