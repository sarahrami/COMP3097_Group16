//
//  TaskContext.swift
//  COMP3097_Group16
//
//  Created by Jerome Delos Reyes on 2024-02-27.
//

import Foundation
import SwiftData

@available(iOS 17, *)
class DataContext {
    // MARK: - CRUD Operations
    
    @available(iOS 17, *)
    func saveTask(_ task: TaskItem) {
        do {
            try SwiftData.insert(task)
        } catch {
            print("Error saving task: \(error)")
        }
    }
    
    func fetchTasks() -> [TaskItem] {
        do {
            let tasks: [TaskItem] = try SwiftData.fetch()
            return tasks
        } catch {
            print("Error fetching tasks: \(error)")
            return []
        }
    }
    
    // Add other CRUD operations as needed
}
