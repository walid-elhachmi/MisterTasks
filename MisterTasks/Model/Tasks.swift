//
//  Tasks+CoreDataClass.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 9/30/20.
//  Copyright © 2020 Walid. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Tasks)
public class Tasks: NSManagedObject {
        
    @NSManaged public var id: Int32
    @NSManaged public var userId: Int32
    @NSManaged public var title: String?
    @NSManaged public var completed: Bool
    @NSManaged public var owner: User?
}

extension Tasks {
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Tasks> {
        return NSFetchRequest<Tasks>(entityName: "Tasks")
    }

}


struct TasksDTO: Codable {
    
    var id: Int32
    var userId: Int32
    var title: String?
    var completed: String?
    var owner: String?
    
    enum CodingKeys: String, CodingKey {
        
        case id
        case userId
        case title
        case completed
        case owner
    }
}
