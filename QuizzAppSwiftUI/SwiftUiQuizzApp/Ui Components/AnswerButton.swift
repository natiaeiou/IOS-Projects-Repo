//
//  AnswerButton.swift
//  SwiftUiQuizzApp
//
//  Created by Atinati on 26.11.25.
//

import SwiftUI

struct AnswerButton: View {
    let text: String
    let index: Int
    let selectedAnswer: Int?
    let correctAnswer: Int
    let showResult: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack(spacing: 16) {
                ZStack {
                    Circle()
                        .strokeBorder(showCheckmark ? Color.white : textColor.opacity(0.3), lineWidth: 2)
                        .frame(width: 28, height: 19)
                    
                    if showCheckmark {
                        Circle()
                            .fill(Color.white)
                            .frame(width: 28, height: 28)
                        
                        Image(systemName: "checkmark")
                            .foregroundStyle(backgroundColor)
                            .font(.system(size: 16, weight: .bold))
                    }
                }
                Text(text)
                    .font(.system(size: 18, weight: .medium))
                    .foregroundStyle(textColor)
                    .multilineTextAlignment(.leading)
                
                Spacer()
            }
            .padding(.horizontal, 24)
            .padding(.vertical, 30)
            .background(backgroundColor)
            .cornerRadius(16)
        }
          .disabled(showResult)
    }
    
    private var backgroundColor: Color {
        if showResult == false {
            return Color.white.opacity(0.9)
        }
        if index == correctAnswer {
            return Color(red: 0.4, green: 0.95, blue: 0.5)
        }
        if index == selectedAnswer {
            return Color(red: 1.0, green: 0.3, blue: 0.3)
        }
        return Color.white.opacity(0.9)
    }
    
    private var textColor: Color {
        if showResult == false {
            return Color(red: 0.1, green: 0.1, blue: 0.2)
        }
        if index == correctAnswer {
            return .white
        }
        if index == selectedAnswer {
            return .white
        }
        return Color(red: 0.1, green: 0.1, blue: 0.2)
    }
    
    private var showCheckmark: Bool {
        if showResult && index == correctAnswer {
            return true
        }
        return false
    }
    
    private var borderColor: Color? {
        if showResult == false {
            return nil
        }
        if index == selectedAnswer && index != correctAnswer {
            return Color(red: 0.9, green: 0.0, blue: 0.5)
        }
        return nil
    }
}

#Preview {
    ContentView()
}
