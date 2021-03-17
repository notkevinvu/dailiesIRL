//
//  DataFetcher.swift
//  DailiesIRL
//
//  Created by Kevin Vu on 2/24/21.
//

import Foundation

/*
 This class should fetch data from our core data store and returns it to the caller
 */

// MARK: - Data fetcher
final class DataFetcher {
    
}



protocol DailyStoreFactory {
    func makeDailyStore() -> DailyStoreProtocol
}


// MARK: - Dependency container
final class DependencyContainer {
    private lazy var testDailyStore: DailyStoreProtocol = TestDailyStore()
}


// MARK: - Daily store extension
extension DependencyContainer: DailyStoreFactory {
    func makeDailyStore() -> DailyStoreProtocol {
        return testDailyStore
    }
}
