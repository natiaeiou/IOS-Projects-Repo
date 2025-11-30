//
//  ContentView.swift
//  SwiftUiQuizzApp
//
//  Created by Atinati on 26.11.25.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject private var quizViewModel = QuizViewModel()
    
    var body: some View {
        TabView {
            QuizView()
                .tabItem {
                    Image(systemName: "square.stack.3d.up.fill")
                    Text("Quiz")
                }
            ProfileView()
                .tabItem {
                    Image(systemName: "doc.plaintext.fill")
                    Text("Profile")
                }
        }
        .environmentObject(quizViewModel)
    }
}


#Preview {
    ContentView()
}
