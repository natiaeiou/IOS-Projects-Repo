//
//  TimerCardView.swift
//  Timer
//
//  Created by Atinati on 25.11.25.
//

import SwiftUI

struct TimerCardView: View {
    @State private var showDeleteAlert = false
    
    let timer: TimerItem
    var onToggle: () -> Void
    var onReset: () -> Void
    var onDelete: () -> Void
    
    var body: some View {
        VStack(spacing: 15) {
            HStack {
                Text(timer.title)
                    .font(.title2)
                    .foregroundColor(.white)
                Spacer()
                
                Button(action: {showDeleteAlert = true
                }) {
                    Image(systemName: "trash")
                        .imageScale(.large)
                        .foregroundStyle(.red)
                }
            }
            .padding()
            
            Text(timer.timeString)
                .font(.system(size: 44, weight: .bold))
                .foregroundColor(.blue)
            
            HStack(spacing: 15) {
                Button(timer.actionText) {
                    onToggle()
                }
                .foregroundStyle(.white)
                .frame(width: 110, height: 39)
                .background(timer.actionColor)
                .cornerRadius(8)
                
                Button("გადატვირთვა") {
                    onReset()
                }
                .foregroundStyle(.white)
                .frame(width: 157, height: 39)
                .background(.red)
                .cornerRadius(8)
            }
            .padding(.bottom)
        }
        .background(Color("cardColor"))
        .cornerRadius(16)
        .padding(.horizontal)
        
        .alert("Delete", isPresented: $showDeleteAlert) {
                    Button("Cancel", role: .cancel) { }
                    Button("Delete", role: .destructive) {
                        onDelete()
                    }
                } message: {
                    Text("Are you sure bro?")
                }
    }
}

#Preview{
    ContentView()
}
