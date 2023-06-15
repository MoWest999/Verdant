//
//  CompostEntry.swift
//  Verdant
//
//  Created by Mason Christeerfield on 6/12/23.
//

import Foundation

// showing amount user has composted for the week 
struct CompostEntry: Identifiable, Codable {
    let id: UUID
    let date: Date
    var amount: Double
    
    var formattedDate: String {
        date.formatted(date: .abbreviated, time: .omitted)
    }
    
    var formattedTime: String {
        date.formatted(date: .omitted, time: .shortened)
    }
        
    init(amount: Double) {
        self.id = UUID()
        self.date = Date()
        self.amount = amount
    }
    
//    init() {
//        self.id = UUID()
//        self.date = Date()
//        self.amount = 0
//    }
}
