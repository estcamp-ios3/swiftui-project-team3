//
//  LevelName.swift
//  DailyCS
//
//  Created by 송서윤 on 7/8/25.
//

import Foundation

enum LevelName: Int, CaseIterable, Identifiable {
    case easy = 1
    case normal = 2
    case hard = 3

    var id: Int {
        rawValue
    }

    var description: String {
        switch self {
        case .easy: return "Easy"
        case .normal: return "Normal"
        case .hard: return "Hard"
        }
    }
}
