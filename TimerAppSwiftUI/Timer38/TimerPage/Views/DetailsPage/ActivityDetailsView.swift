//
//  ActivitiDetailsView.swift
//  Timer38
//
//  Created by Atinati on 28.11.25.
//

import SwiftUI

struct ActivityDetailsView: View {
    let timer: TimerItem
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
                .ignoresSafeArea()
            VStack(spacing: 10) {
                ActivityHeaderView(timerTitle: timer.title)
                Divider()
                    .background(Color("cardColor"))
                
                VStack(spacing: 15) {
                    DurationCardView(duration: timer.timeString)
                        .padding(.top, 21)
                    ActivityHistoryView(historyItems: timer.history)
                }
                .padding(.horizontal, 20)
                Spacer()
                .padding(60)
            }
        }
    }
}

#Preview {
    ContentView()
}


