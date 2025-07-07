//
//  MainView.swift
//  DailyCS
//
//  Created by home on 7/4/25.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            Text("하루 CS")
                .font(.largeTitle)
                .bold(true)
            NavigationLink(destination: SelectLevelView()) {
                Text("문제 풀기")
            }
            .frame(width: 200, height: 50)
            .background(Color.mainGreen)
            .foregroundColor(.white)
            .cornerRadius(20)
        }
    }
}

#Preview {
    MainView()
}
