//
//  MessageBubble.swift
//  CryCounter
//
//  Created by Atinati on 26.11.25.
//
import SwiftUI

struct MessageBubble: View {
    let message: String
    
    var body: some View {
        Text(message)
            .font(.system(size: 18, weight: .semibold))
            .foregroundColor(.purple)
            .padding()
            .background(Color.white)
            .cornerRadius(15)
            .shadow(radius: 5)
    }
}
