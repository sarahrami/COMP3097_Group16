//
//  Task+CoreDataProperties.swift
//  COMP3097_Group16
//
//  Created by Jerome Delos Reyes on 2024-02-27.
//
//

import Foundation
import CoreData


extension Task {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Task> {
        return NSFetchRequest<Task>(entityName: "Task")
    }

    @NSManaged public var category: String
    @NSManaged public var date: Date
    @NSManaged public var body: String
    @NSManaged public var name: String
    @NSManaged public var status: String
    @NSManaged public var time: Date

}

extension Task : Identifiable {

}
