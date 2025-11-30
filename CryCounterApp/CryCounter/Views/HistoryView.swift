//
//  HistoryView.swift
//  CryCounter
//
//  Created by Atinati on 26.11.25.
//
import SwiftUI
import Combine

struct HistoryView: View {
    @ObservedObject var viewModel: CryViewModel
    
    var body: some View {
        ZStack {
            backgroundGradient
            
            VStack(spacing: 0) {
                headerSection
                
                if viewModel.cryEntries.isEmpty {
                    emptyStateView
                } else {
                    historyList
                }
            }
        }
    }
    
    // MARK: View Components
    private var backgroundGradient: some View {
        LinearGradient(
            colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)],
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
    
    private var headerSection: some View {
        Text("Cry History")
            .font(.system(size: 32, weight: .bold))
            .padding(.top, 20)
            .padding(.bottom, 10)
    }
    
    private var emptyStateView: some View {
        VStack {
            Spacer()
            Text("No cries logged yet")
                .font(.system(size: 18))
                .foregroundColor(.gray)
            Spacer()
        }
    }
    
    private var historyList: some View {
        ScrollView {
            VStack(spacing: 12) {
                ForEach(viewModel.sortedEntries) { entry in
                    HistoryRow(
                        entry: entry,
                        daysAgoText: viewModel.daysAgo(from: entry.date)
                    )
                }
            }
            .padding()
        }
    }
}

struct HistoryRow: View {
    let entry: CryEntry
    let daysAgoText: String
    
    var body: some View {
        HStack {
            Rectangle()
                .fill(Color.purple)
                .frame(width: 4)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(entry.date, style: .date)
                    .font(.system(size: 16, weight: .semibold))
                
                Text(daysAgoText)
                    .font(.system(size: 14))
                    .foregroundColor(.gray)
            }
            .padding(.vertical, 8)
            
            Spacer()
        }
        .padding(.horizontal)
        .background(
            LinearGradient(
                colors: [Color.blue.opacity(0.1), Color.purple.opacity(0.1)],
                startPoint: .leading,
                endPoint: .trailing
            )
        )
        .cornerRadius(10)
    }
}
