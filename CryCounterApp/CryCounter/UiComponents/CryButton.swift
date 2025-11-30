//
//  CryButton.swift
//  CryCounter
//
//  Created by Atinati on 26.11.25.
//
import SwiftUI
import Combine

struct CryButton: View {
    @Binding var isPressed: Bool
    let criedToday: Bool
    let showMessage: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                Circle()
                    .fill(
                        LinearGradient(
                            colors: [Color.blue, Color.purple],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 250, height: 250)
                    .shadow(color: .purple.opacity(0.3), radius: 20, x: 0, y: 10)
                    .opacity(criedToday && !showMessage ? 0.6 : 1.0)
                
                VStack(spacing: 10) {
                    Text("😢")
                        .font(.system(size: 70))
                    
                    Text(criedToday ? "✓ Logged Today" : "I Cried Today")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                }
            }
        }
        .scaleEffect(isPressed ? 0.95 : 1.0)
    }
}
