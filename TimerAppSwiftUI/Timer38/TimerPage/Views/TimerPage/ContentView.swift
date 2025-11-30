//
//  ContentView.swift
//  Timer
//
//  Created by Atinati on 22.11.25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = TimerViewModel()
    
    var body: some View {
        NavigationStack{
            ZStack {
                Color("backgroundColor")
                    .ignoresSafeArea()
                
                VStack(spacing: 5) {
                    HStack {
                        Text("ტაიმერები").font(.title).bold()
                            .foregroundStyle(.white)
                            .padding(.leading)
                        Spacer()
                    }
                    .padding(.vertical, 15)
                    .background(Color("cardColor"))
                    
                    ScrollView {
                        LazyVStack(spacing: 15) {
                            ForEach(viewModel.timers) { timer in
                                NavigationLink(destination: ActivityDetailsView(timer: timer)) {
                                    TimerCardView(
                                        timer: timer,
                                        onToggle: {
                                            viewModel.toggleTimer(id: timer.id)
                                        },
                                        onReset: {
                                            viewModel.resetTimer(id: timer.id)
                                        },
                                        onDelete: {
                                            viewModel.deleteTimer(id: timer.id)
                                        }
                                    )
                                }
                            }
                        }
                        .padding(.top)
                    }
                    AddTimerView()
                        .environmentObject(viewModel)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
