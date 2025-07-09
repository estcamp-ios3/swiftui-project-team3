//
//  Color+Ext.swift
//  DailyCS
//
//  Created by 최용헌 on 7/4/25.
//

import UIKit
import SwiftUIa

extension UIColor {
  // 메인 버튼, 강조
  static let mainGreen = UIColor(hex: "#2E7D32")
  // 서브 배경, 카드
  static let lightLime = UIColor(hex: "#81C784")
  // 제목, 점수 강조
  static let mediumGreen = UIColor(hex: "#388E3C")
  // 전체 배경용
  static let veryLightGreenBackground = UIColor(hex: "#F1F8E9")
  // 텍스트용 다크그레이
  static let darkGrayText = UIColor(hex: "#333333")
  // 에러/오답
  static let errorRed = UIColor(hex: "#EF5350")
  // 정답 표시
  static let correctGreen = UIColor(hex: "#66BB6A")
  // 포인트 강조
  static let accentGreen = UIColor(hex: "#43A047")
  
  // HEX 문자열을 UIColor로 변환하는 헬퍼 이니셜라이저
  convenience init?(hex: String) {
    let r, g, b, a: CGFloat
    
    if hex.hasPrefix("#") {
      let start = hex.index(hex.startIndex, offsetBy: 1)
      let hexColor = String(hex[start...])
      
      if hexColor.count == 6 {
        let scanner = Scanner(string: hexColor)
        var hexNumber: UInt64 = 0
        
        if scanner.scanHexInt64(&hexNumber) {
          r = CGFloat((hexNumber & 0xff0000) >> 16) / 255
          g = CGFloat((hexNumber & 0x00ff00) >> 8) / 255
          b = CGFloat(hexNumber & 0x0000ff) / 255
          a = 1.0 // 기본 알파값
          
          self.init(red: r, green: g, blue: b, alpha: a)
          return
        }
      }
    }
    return nil
  }
}

extension Color {
  // 메인 버튼, 강조
  static let mainGreen = Color(UIColor.mainGreen ?? .clear)
  // 서브 배경, 카드
  static let lightLime = Color(UIColor.lightLime ?? .clear)
  // 제목, 점수 강조
  static let mediumGreen = Color(UIColor.mediumGreen ?? .clear)
  // 전체 배경용
  static let veryLightGreenBackground = Color(UIColor.veryLightGreenBackground ?? .clear)
  // 텍스트용 다크그레이
  static let darkGrayText = Color(UIColor.darkGrayText ?? .clear)
  // 에러/오답
  static let errorRed = Color(UIColor.errorRed ?? .clear)
  // 정답 표시
  static let correctGreen = Color(UIColor.correctGreen ?? .clear)
  // 포인트 강조
  static let accentGreen = Color(UIColor.accentGreen ?? .clear)
}
