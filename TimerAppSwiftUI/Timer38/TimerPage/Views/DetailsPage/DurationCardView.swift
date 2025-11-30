//
//  DurationCardView.swift
//  Timer38
//
//  Created by Atinati on 28.11.25.
//

import SwiftUI

struct DurationCardView: View {
    let duration: String
    var body: some View {
        VStack(spacing: 22) {
            Image("stopWatchIcon")
                .resizable()
                .scaledToFit()
                .frame(width: 70, height: 70)
            
            Text("ხანგრძლივობა")
                .font(.body)
                .foregroundColor(.white.opacity(0.7))
            
            Text(duration)
                .font(.system(size: 48, weight: .medium, design: .rounded))
                .foregroundColor(.blue)
                .monospacedDigit()
        }
        .frame(maxWidth: .infinity)
        .frame(width: 360, height: 300)
        .background(Color(white: 0.15))
        .cornerRadius(16)
    }

}

