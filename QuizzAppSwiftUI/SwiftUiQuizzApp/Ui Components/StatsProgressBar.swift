//
//  StatsProgressBar.swift
//  SwiftUiQuizzApp
//
//  Created by Atinati on 26.11.25.
//

import SwiftUI

struct StatsProgressBar: View {
    let correct: Int
    let total: Int
    
    var body: some View {
        GeometryReader { geo in
            if total > 0 {
                let width = geo.size.width
                
                HStack(spacing: 0) {
                    Rectangle()
                        .fill(Color.green)
                        .frame(width: width * CGFloat(correct) / CGFloat(total))
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: width * CGFloat(total - correct) / CGFloat(total))
                }
                .cornerRadius(15)
            } else {
                Rectangle()
                    .fill(Color.gray.opacity(0.3))
                    .cornerRadius(15)
            }
        }
        .frame(height: 30)
    }
}

#Preview {
   ContentView()
}
