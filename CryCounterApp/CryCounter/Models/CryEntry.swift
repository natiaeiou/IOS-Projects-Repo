//
//  CryEntry.swift
//  CryCounter
//
//  Created by Atinati on 26.11.25.
//

import SwiftUI

struct CryEntry: Codable, Identifiable, Hashable {
    let id: UUID
    let date: Date
    
    init(id: UUID = UUID(), date: Date) {
        self.id = id
        self.date = date
    }
}

