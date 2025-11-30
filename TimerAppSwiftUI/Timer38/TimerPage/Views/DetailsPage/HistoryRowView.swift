//
//  HistoryRowView.swift
//  Timer38
//
//  Created by Atinati on 29.11.25.
//

import SwiftUI

struct HistoryRowView: View {
    let date: String
    let time: String
    
    var body: some View {
        HStack {
            Text(date)
                .font(.body)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            Text(time)
                .font(.body)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity, alignment: .trailing)
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 12)
    }
}

