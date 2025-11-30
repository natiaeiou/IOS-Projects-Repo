//
//  SwiftUIView.swift
//  SwiftUiQuizzApp
//
//  Created by Atinati on 26.11.25.
//

import SwiftUI
import Combine

struct ProfileView: View {
    @EnvironmentObject var quizManager: QuizViewModel
    
    var profileData: [Profile] {
        [Profile(title: "Username", description: "Nati"),
         Profile(title: "Questions answered?", description: "\(quizManager.questionsAnswered)"),
         Profile(title: "Correct answers", description: "\(quizManager.correctAnswers)")
        ]
    }
    
    var body: some View {
        VStack {
            Image("brainLogo")
                .resizable()
                .scaledToFit()
                .frame(width: 104, height: 98)
                .padding()
            
            List {
                ForEach(profileData, id: \.title) { profile in
                    HStack {
                        VStack(alignment: .leading, spacing: 10) {
                            Text(profile.title)
                                .foregroundStyle(.white)
                                .font(.system(size: 18, weight: .light))
                            Text(profile.description)
                                .font(.system(size: 18, weight: .medium))
                                .foregroundStyle(.white)
                        }
                    }
                    .listRowBackground(Color.clear)
                    .listRowSeparator(Visibility.hidden)
                    .listRowInsets(EdgeInsets(top: 20, leading: 0, bottom: 5, trailing: 0))
                }
            }
            .padding()
            .listStyle(.plain)
            
            HStack {
                Text("Stats")
                    .foregroundStyle(.white)
                    .font(.system(size: 22))
                Spacer()
            }
            .padding(.horizontal)
            
            StatsProgressBar(
                correct: quizManager.correctAnswers,
                total: quizManager.questionsAnswered
            )
            .padding(.horizontal)
            .padding(.bottom, 150)
            
            Button("Reset") {
                quizManager.reset()
            }
            .foregroundStyle(.white)
            .frame(width: 130, height: 44)
            .background(.red)
            .cornerRadius(100)
            .padding(.bottom, 30)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            BackgroundColor()
        )
    }
}

#Preview {
    ProfileView()
        .environmentObject(QuizViewModel())
}
