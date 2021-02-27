//
//  DailyStore.swift
//  DailiesIRL
//
//  Created by Kevin Vu on 2/27/21.
//

import Foundation
// TODO: Add core data import

protocol DailyStoreProtocol {
    func fetchDailies(completion: @escaping ([NaiveDaily]) -> Void)
}


final class TestDailyStore: DailyStoreProtocol {
    
    private var testDailies: [NaiveDaily] = [
        NaiveDaily(name: "Wash your face", frequency: .daily),
        NaiveDaily(name: "Stretch for 5 minutes", frequency: .daily),
        NaiveDaily(name: "Walk for 5 minutes", frequency: .daily),
        NaiveDaily(name: "Take 10 deep breaths", frequency: .daily),
        NaiveDaily(name: "Take a short nap", frequency: .daily),
        NaiveDaily(name: "Play with your pets", frequency: .daily),
        NaiveDaily(name: "Start reading a book or article", frequency: .daily),
        NaiveDaily(name: "Drink water", frequency: .daily),
        NaiveDaily(name: "Make some food or eat a snack", frequency: .daily),
        NaiveDaily(name: "Clean your room (even part of it)", frequency: .daily),
        NaiveDaily(name: "Give a friend a compliment", frequency: .daily),
        NaiveDaily(name: "Call your parents", frequency: .daily)
    ]
    
    func fetchDailies(completion: @escaping ([NaiveDaily]) -> Void) {
        completion(testDailies)
    }
}
