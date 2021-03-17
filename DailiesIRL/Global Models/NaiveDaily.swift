//
//  Dailies.swift
//  DailiesIRL
//
//  Created by Kevin Vu on 2/24/21.
//

import Foundation


struct NaiveDaily {
    
    enum DailyStatus {
        case inProgress,
             completed
    }
    
    enum Frequency {
        case oneTime,
             daily
    }
    
    public var name: String
    public var status: DailyStatus = .inProgress
    public var frequency: Frequency
    public var id: UUID = UUID()
}

extension NaiveDaily: Hashable {}
