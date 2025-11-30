//
//  TimerItem.swift
//  Timer
//
//  Created by Atinati on 24.11.25.
//

import SwiftUI

struct TimerItem: Identifiable {
    let id = UUID()
    var title: String
    var totalSeconds: Int
    var remainingSeconds: Int 
    var isRunning: Bool = false
    var isPaused: Bool = false
    var history: [HistoryItem] = []
    
    var timeString: String {
        let hours = remainingSeconds / 3600
        let minutes = (remainingSeconds % 3600) / 60
        let seconds = remainingSeconds % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
    
    var actionText: String {
        if isRunning {
            return "პაუზა"
        } else if isPaused {
            return "გაგრძელება"
        } else {
            return "დაწყება"
        }
    }
    
    var actionColor: Color {
        if isRunning {
            return .orange
        } else {
            return .green
        }
    }
    
    var resetText: String = "გადატვირთვა"
    var resetColor: Color = .red
}
