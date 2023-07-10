//
//  MovieQuizPresenterTests.swift
//  MovieQuizTests
//
//  Created by Dmitry Kirdin on 21.07.2023.
//

import XCTest

@testable import MovieQuiz

final class MovieQuizControllerMock: MovieQuizViewControllerProtocol {
    
    func showLoadingIndicator() {
        
    }
    func hideLoadingIndicator() {
        
    }
    func showNetworkError(message: String) {
        
    }
    func showQuizStep(quiz step: QuizStepViewModel) {
        
    }
    func highlightImageBorder(isCorrectAnswer: Bool) {
        
    }
    func showQuizResults(quiz result: QuizResultsViewModel) {
        
    }
}

final class MovieQuizPresenterTests: XCTestCase {
    func testPreseterConvertModel () throws {
        let viewControllerMock = MovieQuizControllerMock()
        let sut = MovieQuizPresenter(viewController: viewControllerMock)
        
        let emptyData = Data()
        let question = QuizQuestion(image: emptyData, text: "Question Text", correctAnswer: true)
        let viewModel = sut.convert(model: question)
        
        XCTAssertNotNil(viewModel.image)
        XCTAssertEqual(viewModel.question, "Question Text")
        XCTAssertEqual(viewModel.questionNumber, "1/10")
    }
}
