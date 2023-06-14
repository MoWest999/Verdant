//
//  CompostEntry.swift
//  Verdant
//
//  Created by Mason Christeerfield on 6/12/23.
//

import Foundation

// showing amount user has composted for the week 
struct CompostEntry: Identifiable, Codable {
    var id = UUID()
    
    var formattedDate = Date().formatted(
        .dateTime
            .day().month(.wide).year()
    )
    var formattedTime = Date().formatted(
        .dateTime
            .hour().minute()
    )
    
    var amount = ""
}
