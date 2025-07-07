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
//  var modelContainer: ModelContainer = {
//    let schema = Schema([QuestionDataForSave.self])
//    
//    let configuration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
//    
//    do {
//      let container = try ModelContainer(for: schema, configurations: [configuration])
//      return container
//    }catch {
//      fatalError("Model Conatiner 생성 실패: \(error)")
//    }
//  }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: QuestionDataForSave.self)
    }
  
  
}


