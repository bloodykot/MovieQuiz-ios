//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Dmitry Kirdin on 23.06.2023.
//

import Foundation
import UIKit

protocol AlertPresenterProtocol {
    func showAlert(alertModel: AlertModel)
}

final class AlertPresenter {
    //private var alertView: AlertModel
    private weak var viewControllerDelegate: UIViewController?
    
    init(viewController: UIViewController?) {
        self.viewControllerDelegate = viewController
    }
}
extension AlertPresenter: AlertPresenterProtocol {
    internal func showAlert(alertModel: AlertModel) {
        let alert = UIAlertController(      // создаём объекты всплывающего окна
            title: alertModel.title,        // заголовок всплывающего окна
            message: alertModel.message,       // текст во всплывающем окне
            preferredStyle: .alert)     // preferredStyle может быть .alert или .actionSheet
        alert.view.accessibilityIdentifier = "Game results"
        // константа с кнопкой для системного алерта
        let action = UIAlertAction(title: alertModel.buttonText, style: .default) { _ in
            alertModel.completion()
        }
        // добавляем в алерт кнопку
        alert.addAction(action)
        // показываем всплывающее окно
        viewControllerDelegate?.present(alert, animated: true, completion: nil)
    }
}
