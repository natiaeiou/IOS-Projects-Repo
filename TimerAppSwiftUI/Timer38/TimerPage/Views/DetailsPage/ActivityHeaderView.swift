//
//  ActivityHeaderView.swift
//  Timer38
//
//  Created by Atinati on 28.11.25.
//

import SwiftUI

struct ActivityHeaderView : View {
    let timerTitle: String
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Spacer()
                Text(timerTitle)
                    .font(.system(size: 28, weight: .bold))
                    .foregroundStyle(.white)
    
                Spacer()
            }    
                .padding(.top, 65)
                .padding(.bottom, 35)
                .background(Color("cardColor"))
        }
        .ignoresSafeArea(edges: .top)
    }
}

#Preview{
    ContentView()
}
