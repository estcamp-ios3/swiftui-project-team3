//
//  SelectLevelView.swift
//  DailyCS
//
//  Created by home on 7/4/25.
//

import SwiftUI

struct SelectLevelView: View {
    var body: some View {
        
        Button(action: {}) {
            Text("쉬움")
        }
        
        NavigationLink(destination: CSQuestionView()) {
            Text("시작")
        }
        
    }
}

#Preview {
    SelectLevelView()
}
