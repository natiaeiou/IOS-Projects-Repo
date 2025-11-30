//
//  QuizViewModel.swift
//  SwiftUiQuizzApp
//
//  Created by Atinati on 26.11.25.
//

import SwiftUI
import Combine

class QuizViewModel: ObservableObject {
    @Published var currentQuestionIndex: Int = 0
    @Published var questionsAnswered: Int = 0
    @Published var correctAnswers: Int = 0
    @Published var selectedAnswer: Int? = nil
    @Published var showResult: Bool = false
    
    @Published var quizQuestions: [QuizQuestion] = []
    
    init() {
        loadQuizData()
    }
    
    var currentQuestion: QuizQuestion {
        quizQuestions[currentQuestionIndex]
    }
    
    var totalQuestions: Int {
        quizQuestions.count
    }
    
    var progressValue: CGFloat {
        guard questionsAnswered > 0 else { return 0 }
        return CGFloat(correctAnswers) / CGFloat(questionsAnswered)
    }
    
    func loadQuizData() {
        guard let url = Bundle.main.url(forResource: "quiz", withExtension: "json"),
              let data = try? Data(contentsOf: url),
              let quiz = try? JSONDecoder().decode(QuizResponse.self, from: data) else {
            return
        }
        quizQuestions = quiz.quiz
    }
    
    func selectAnswer(_ index: Int) {
        guard selectedAnswer == nil else { return }
        selectedAnswer = index
        showResult = true
        questionsAnswered += 1
        
        if currentQuestion.options[index] == currentQuestion.correctAnswer {
            correctAnswers += 1
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { [weak self] in
            self?.nextQuestion()
        }
    }
    
    func nextQuestion() {
        if currentQuestionIndex < quizQuestions.count - 1 {
            currentQuestionIndex += 1
        } else {
            currentQuestionIndex = 0
        }
        selectedAnswer = nil
        showResult = false
    }
    
    func reset() {
        currentQuestionIndex = 0
        questionsAnswered = 0
        correctAnswers = 0
        selectedAnswer = nil
        showResult = false
    }
}
