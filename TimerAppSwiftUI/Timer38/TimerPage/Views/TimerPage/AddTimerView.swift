//
//  AddTimerView.swift
//  Timer
//
//  Created by Atinati on 24.11.25.
//

import SwiftUI

struct AddTimerView: View {
    
    @State private var timerName: String = ""
    @State private var hours: String = ""
    @State private var minutes: String = ""
    @State private var seconds: String = ""
    
    @EnvironmentObject var viewModel: TimerViewModel
    
    var body: some View {
        VStack(spacing: 15) {
            TextField("", text: $timerName, prompt: Text("ტაიმერის სახელი...").foregroundColor(.gray))
                .padding()
                .background(Color("backgroundColor"))
                .foregroundColor(.white)
                .cornerRadius(8)
                .padding(.horizontal)
            
            HStack(spacing: 15) {
                TextField("", text: $hours, prompt: Text("სთ").foregroundColor(.gray))
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(height: 39)
                    .background(Color("backgroundColor"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                
                TextField("", text: $minutes, prompt: Text("წთ").foregroundColor(.gray))
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(height: 39)
                    .background(Color("backgroundColor"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
                
                TextField("", text: $seconds, prompt: Text("წმ").foregroundColor(.gray))
                    .multilineTextAlignment(.center)
                    .padding()
                    .frame(height: 39)
                    .background(Color("backgroundColor"))
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
            .padding(.horizontal)
            
            Button(action: {
                viewModel.addNewTimer(title: timerName, hours: hours, minutes: minutes, seconds: seconds)
                timerName = ""
                hours = ""
                minutes = ""
                seconds = ""
            }) {
                Text("დამატება")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(width: 160, height: 44)
                    .background(Color.blue)
                    .cornerRadius(8)
            }
        }
        .padding(.vertical, 15)
        .background(Color("cardColor"))
    }
}

#Preview {
    ContentView()
}
