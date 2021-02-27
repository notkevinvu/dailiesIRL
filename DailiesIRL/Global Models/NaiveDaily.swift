//
//  Dailies.swift
//  DailiesIRL
//
//  Created by Kevin Vu on 2/24/21.
//

import Foundation


final class NaiveDaily {
    
    enum DailyStatus {
        case inProgress,
             completed
    }
    
    enum Frequency {
        case oneTime,
             daily
    }
    
    public var name: String
    public var status: DailyStatus
    public var frequency: Frequency
    
    init(name: String, status: DailyStatus = .inProgress, frequency: Frequency) {
        self.name = name
        self.status = status
        self.frequency = frequency
    }
    
}
