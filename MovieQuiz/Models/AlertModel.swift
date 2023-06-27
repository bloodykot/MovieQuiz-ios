//
//  AlertModel.swift
//  MovieQuiz
//
//  Created by Dmitry Kirdin on 23.06.2023.
//

import Foundation
struct AlertModel {
    let title: String //текст заголовка алерта
    var message: String //текст сообщения алерта
    let buttonText: String //текст для кнопки алерта
    let completion: () -> Void
}
