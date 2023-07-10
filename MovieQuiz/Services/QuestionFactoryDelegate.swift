//
//  QuestionFactoryDelegate.swift
//  MovieQuiz
//
//  Created by Dmitry Kirdin on 22.06.2023.
//

import Foundation
protocol QuestionFactoryDelegate: AnyObject {               // 1
    func didReceiveNextQuestion(question: QuizQuestion?)    // 2
    func didLoadDataFromServer() // сообщение об успешной загрузке
    func didFailToLoadData(with error: Error) // сообщение об ошибке загрузки
}

