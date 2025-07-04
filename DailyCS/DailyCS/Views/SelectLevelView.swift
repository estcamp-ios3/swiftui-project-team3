//
//  SelectLevelView.swift
//  DailyCS
//
//  Created by home on 7/4/25.
//

import SwiftUI

struct SelectLevelView: View {
    var body: some View {
        NavigationLink(destination: CSQuestionView()) {
            Text("쉬움")
        }
        
    }
}

#Preview {
    SelectLevelView()
}
