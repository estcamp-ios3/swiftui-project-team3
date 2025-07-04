//
//  ContentView.swift
//  DailyCS
//
//  Created by 최용헌 on 7/4/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Tab("메인", systemImage: "house") {
                MainView()
            }
        }
    }
}

#Preview {
    ContentView()
}
