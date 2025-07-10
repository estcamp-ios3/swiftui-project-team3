//
//  LavelCase.swift
//  DailyCS
//
//  Created by 최용헌 on 7/10/25.
//

import Foundation

/// 레벨에 따른 케이스
enum LevelCase: Int, CaseIterable, Identifiable {
  case easy = 1
  case normal = 2
  case hard = 3
  
  var id: Int { rawValue }

  /// 버튼 및 네비게이션 타이틀
  var titleValue: String {
    switch self {
    case .easy: "Easy"
    case .normal: "Normal"
    case .hard: "Hard"
    }
  }
  
  
  ///  난이도 문자열로 변경
  /// - Parameter rawValue: 문제의 레벨
  /// - Returns: 변환된 난이도
  static func converToString(for rawValue: Int) -> String {
    return LevelCase(rawValue: rawValue)?.titleValue ?? "Easy"
  }
  
  /// 선택한 난이도에 대한 이름과 설명을 반환합니다.
  /// - Parameter difficultyLevel: 선택된 난이도 (1~3)
  /// - Returns: (이름, 설명) 튜플
  static func printLevel(for difficultyLevel: Int) -> (name: String, description: String) {
    switch LevelCase(rawValue: difficultyLevel) {
    case .easy:
      return ("난이도 Easy", "해당 난이도는 0 ~ 1년차 대상입니다.")
    case .normal:
      return ("난이도 Normal", "해당 난이도는 1 ~ 3년차 대상입니다.")
    case .hard:
      return ("난이도 Hard", "해당 난이도는 5 ~ 7년차 이상 대상입니다.")
    case .none:
      return ("난이도를 선택해주세요.", "")
    }
  }
  
  static func fromTitle(_ title: String) -> LevelCase? {
    return LevelCase.allCases.first(where: { $0.titleValue == title })
  }
}
