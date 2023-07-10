//
//  QuestionFactoryProtocol.swift
//  MovieQuiz
//
//  Created by Dmitry Kirdin on 22.06.2023.
//

import Foundation
protocol QuestionFactoryProtocol {
    func requestNextQuestion() //фабрика ответ вернет не сразу и вернет его в делегат -> QuizQuestion?
    func loadData()
}
