//
//  ActivityHistoryView.swift
//  Timer38
//
//  Created by Atinati on 28.11.25.
//

import SwiftUI

struct ActivityHistoryView: View {
    let historyItems: [HistoryItem]
    
    var body: some View {
        VStack(spacing: 0) {
            VStack(alignment: .leading, spacing: 0) {
                Text("აქტივობის ისტორია")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                    .padding(.bottom, 15)
                    .padding(.top,30)
                
                Divider()
                    .frame(height: 0.7)
                    .background(Color.white.opacity(3))
                    .padding(.horizontal, 20)
                HStack {
                    Text("თარიღი")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.6))
                    Spacer()
                    Text("დრო")
                        .font(.subheadline)
                        .foregroundColor(.white.opacity(0.6))
                        .padding(.trailing,30)
                }
                .padding(.horizontal, 20)
                .padding(.top,15)
                .padding(.bottom, 8)
                
                if historyItems.isEmpty {
                    VStack {
                        Spacer()
                        Text("ისტორია ცარიელია")
                            .font(.body)
                            .foregroundColor(.white.opacity(0.5))
                        Spacer()
                    }
                    .frame(width: 340, height: 220)
                } else {
                    ScrollView {
                        VStack(spacing: 0) {
                            ForEach(historyItems) { item in
                                HistoryRowView(date: item.formattedDate, time: item.formattedTime)
                            }
                        }
                    }
                    .frame(width: 340, height: 220)
                }
            }
            .background(Color(white: 0.15))
            .cornerRadius(16)
        }
    }
}

#Preview {
    ContentView()
}
