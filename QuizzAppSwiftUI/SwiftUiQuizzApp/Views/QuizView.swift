//
//  QuizView.swift
//  SwiftUiQuizzApp
//
//  Created by Atinati on 26.11.25.
//

import Combine
import SwiftUI

struct QuizView: View {
    @EnvironmentObject var quizViewModel: QuizViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text("Question \(quizViewModel.currentQuestionIndex + 1)")
                    .font(.system(size: 15, weight: .medium))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(
                        Capsule()
                            .fill(Color(red: 97/255, green: 85/255, blue: 245/255, opacity: 1))
                    )
                Spacer()
                
                Text("Nati")
                    .font(.system(size: 20, weight: .medium))
                    .foregroundStyle(.white)
            }
            .padding(.horizontal)
            .padding(.top, 20)
            
            Spacer()
            
            Text(quizViewModel.currentQuestion.question)
                .font(.system(size: 24, weight: .medium))
                .foregroundStyle(.white)
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 30)
                .padding(.bottom, 40)
            
            VStack(spacing: 16) {
                ForEach(0..<quizViewModel.currentQuestion.options.count, id: \.self) { index in
                    AnswerButton(
                        text: quizViewModel.currentQuestion.options[index],
                        index: index,
                        selectedAnswer: quizViewModel.selectedAnswer,
                        correctAnswer: quizViewModel.currentQuestion.options.firstIndex(of: quizViewModel.currentQuestion.correctAnswer) ?? 0,
                        showResult: quizViewModel.showResult
                    ) {
                        quizViewModel.selectAnswer(index)
                    }
                }
            }
            .padding(.horizontal)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            BackgroundColor()
        )
    }
}

#Preview {
    ContentView()
}
