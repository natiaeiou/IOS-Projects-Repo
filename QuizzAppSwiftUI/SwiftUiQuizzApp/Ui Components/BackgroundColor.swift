//
//  BackgroundColor.swift
//  SwiftUiQuizzApp
//
//  Created by Atinati on 26.11.25.
//

import SwiftUI

struct BackgroundColor: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    Color(red: 1/255, green: 2/255, blue: 15/255).opacity(0.98),
                    Color(red: 8/255, green: 12/255, blue: 30/255).opacity(0.85)
                ]
            ),
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .edgesIgnoringSafeArea(.all)
    }
}
