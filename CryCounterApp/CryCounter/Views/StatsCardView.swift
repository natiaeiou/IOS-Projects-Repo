//
//  StatsCard.swift
//  CryCounter
//
//  Created by Atinati on 26.11.25.
//
import SwiftUI

struct StatsCardView: View {
    let totalCries: Int
    let criesThisMonth: Int
    
    var body: some View {
        VStack(spacing: 15) {
            Text("Your Stats")
                .font(.system(size: 20, weight: .semibold))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            StatRow(
                label: "Total cries:",
                value: "\(totalCries)",
                color: .purple
            )
            
            StatRow(
                label: "This month:",
                value: "\(criesThisMonth)",
                color: .blue
            )
        }
        .padding()
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
}

struct StatRow: View {
    let label: String
    let value: String
    let color: Color
    
    var body: some View {
        HStack {
            Text(label)
                .foregroundColor(.gray)
            Spacer()
            Text(value)
                .font(.system(size: 18, weight: .bold))
                .foregroundColor(color)
        }
    }
}
