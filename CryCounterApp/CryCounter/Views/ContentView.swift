//
//  ContentView.swift
//  CryCounter
//
//  Created by Atinati on 26.11.25.
//
import Combine
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CryViewModel()
    
    var body: some View {
        TabView {
            MainView(viewModel: viewModel)
                .tabItem {
                    Label("Home", systemImage: "drop.fill")
                }
            
            HistoryView(viewModel: viewModel)
                .tabItem {
                    Label("History", systemImage: "calendar")
                }
        }
    }
}


#Preview {
    ContentView()
}
