//
//  TaskItem.swift
//  COMP3097_Group16
//
//  Created by Jerome Delos Reyes on 2024-02-27.
//

import Foundation
import SwiftData

enum Status: Codable {
    case complete
    case incomplete
    case inProgress
}

@available(iOS 17, *)
@Model
class TaskItem: Identifiable {
    var id: String
    var name: String
    var details: String // cannot be named description for some reason
    var category: String
    var date: Date
    var time: Date
    var status: Status
    
    init(name: String, details: String, category: String, date: Date, time: Date, status: Status) {
        id = UUID().uuidString;
        
        self.name = name;
        self.details = details
        self.category = category
        self.date = date
        self.time = time
        self.status = status
    }
}
