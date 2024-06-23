//
//  Activity.swift
//  HabitCycle
//
//  Created by Görkem Güray on 23.06.2024.
//

import Foundation

struct Activity: Identifiable, Hashable, Codable, Equatable {
    var id = UUID()
    let name: String
    let description: String
    var count: Int
    
}
