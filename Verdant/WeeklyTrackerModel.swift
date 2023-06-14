//
//  WeeklyTrackerModel.swift
//  Verdant
//
//  Created by Mason Christeerfield on 6/7/23.
//

import Foundation
struct WeeklyTracker {
    let weekStartDate: Date
    var compostingActivities: [CompostingActivity]
}


struct CompostData {
    let date: String
    let time: String
    let amount: String
}

struct TrackerData {
    var compostAmount: Double = 0.0
    var maxValue: Double = 0.0
    var compostDataCollection: [CompostData] = []
}
