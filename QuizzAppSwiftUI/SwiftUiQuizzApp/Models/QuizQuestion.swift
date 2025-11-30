//
//  QuizQuestion.swift
//  SwiftUiQuizzApp
//
//  Created by Atinati on 26.11.25.
//

import SwiftUI

struct QuizQuestion: Identifiable, Codable {
    let id: Int
    let question: String
    let options: [String]
    let correctAnswer: String

    enum CodingKeys: String, CodingKey {
        case id, question, options
        case correctAnswer = "correct_answer"
    }
}


struct QuizResponse: Codable {
    let quiz: [QuizQuestion]
}

