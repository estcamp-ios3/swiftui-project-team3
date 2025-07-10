//
//  NavigationUtils.swift
//  DailyCS
//
//  Created by 최용헌 on 7/9/25.
//

import Foundation
import UIKit


/// 네비게이션 관련 유틸
struct NavigationUtil {
  
  /// 루트뷰로 이동하기
  static func popToRootView() {
    let keyWindow = UIApplication.shared.connectedScenes
      .filter({$0.activationState == .foregroundActive})
      .compactMap({$0 as? UIWindowScene})
      .first?.windows
      .filter({$0.isKeyWindow}).first
    
    findNavigationController(viewController: keyWindow?.rootViewController)?
      .popToRootViewController(animated: true)
  }
  
  
  /// 화면 찾기
  /// - Parameter viewController: 원하는 화면
  static func findNavigationController(viewController: UIViewController?) -> UINavigationController? {
     guard let viewController = viewController else {
       return nil
     }
  
     if let navigationController = viewController as? UINavigationController {
       return navigationController
     }
  
     for childViewController in viewController.children {
       return findNavigationController(viewController: childViewController)
     }
  
     return nil
   }
}
