//
//  HistoryItem.swift
//  Timer38
//
//  Created by Atinati on 28.11.25.
//

import SwiftUI

struct HistoryItem: Identifiable {
    let id = UUID()
    let date: Date
    let duration: Int
    
    var formattedDate: String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ka_GE")
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: date)
    }
    
    var formattedTime: String {
        let hours = duration / 3600
        let minutes = (duration % 3600) / 60
        let seconds = duration % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

    


