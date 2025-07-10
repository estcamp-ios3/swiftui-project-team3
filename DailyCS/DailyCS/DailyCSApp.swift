//
//  DailyCSApp.swift
//  DailyCS
//
//  Created by 최용헌 on 7/4/25.
//

import SwiftUI
import SwiftData

@main
struct DailyCSApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: QuestionDataForSave.self)
    }
  
  
}


