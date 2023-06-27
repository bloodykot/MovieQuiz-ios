//
//  StatisticService.swift
//  MovieQuiz
//
//  Created by Dmitry Kirdin on 25.06.2023.
//

import Foundation
protocol StatisticServiceProtocol {
    var totalAccuracy: Double { get }
    var gamesCount: Int { get }
    var bestGame: GameRecord? { get }
    func store(correct count: Int, total amount: Int)
}

final class StatisticServiceImplementation {
    
    private enum Keys: String {
        case correct, total, bestGame, gamesCount
    }
    private let userDafaults: UserDefaults
    private let decoder: JSONDecoder
    private let encoder: JSONEncoder
    private let dateProvider: ()->Date
    
    init(
        userDafaults: UserDefaults = .standard,
        decoder: JSONDecoder = JSONDecoder(),
        encoder: JSONEncoder = JSONEncoder(),
        dateProvider: @escaping () -> Date = { Date() }
    ) {
        self.userDafaults = userDafaults
        self.decoder = decoder
        self.encoder = encoder
        self.dateProvider = dateProvider
    }
}

extension StatisticServiceImplementation: StatisticServiceProtocol {
    
    var totalAccuracy: Double {
        Double(correct) / Double(total) * 100
    }
    
    var gamesCount: Int {
        get {
            userDafaults.integer(forKey: Keys.gamesCount.rawValue)
        }
        set {
            userDafaults.set(newValue, forKey: Keys.gamesCount.rawValue)
        }
    }
    
    var total: Int {
        get {
            userDafaults.integer(forKey: Keys.total.rawValue)
        }
        set {
            userDafaults.set(newValue, forKey: Keys.total.rawValue)
        }
    }
    
    var correct: Int {
        get {
            userDafaults.integer(forKey: Keys.correct.rawValue)
        }
        set {
            userDafaults.set(newValue, forKey: Keys.correct.rawValue)
        }
    }
    
    var bestGame: GameRecord? {
        get {
            guard let data = userDafaults.data(forKey: Keys.bestGame.rawValue),
            let record = try? decoder.decode(GameRecord.self, from: data) else {
                return .init(correct: 0, total: 0, date: Date())
            }
            
            return record
        }
        
        set {
            guard let data = try? encoder.encode(newValue) else {
                print("Невозможно сохранить результат")
                return
            }
            
            userDafaults.set(data, forKey: Keys.bestGame.rawValue)
        }
    }
    
    func store(correct count: Int, total amount: Int) {
        self.correct += count
        self.total += amount
        self.gamesCount += 1
        let data = dateProvider()
        let currentBestGame = GameRecord(correct: count, total: amount, date: data)
        
        if let previousBestGame = bestGame {
            if currentBestGame > previousBestGame {
                bestGame = currentBestGame
            }
        } else {
            bestGame = currentBestGame
        }
    }
    
}
