//
//  User+CoreDataClass.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 9/30/20.
//  Copyright © 2020 Walid. All rights reserved.
//
//

import Foundation
import CoreData

@objc(User)
public class User: NSManagedObject {

}


extension User {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
    
    @NSManaged public var id: Int32
    @NSManaged public var name: String?
    @NSManaged public var username: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?
    @NSManaged public var website: String?
    @NSManaged public var tasks: NSSet?

}

// MARK: Generated accessors for tasks
extension User {

    @objc(addTasksObject:)
    @NSManaged public func addToTasks(_ value: Tasks)

    @objc(removeTasksObject:)
    @NSManaged public func removeFromTasks(_ value: Tasks)

    @objc(addTasks:)
    @NSManaged public func addToTasks(_ values: NSSet)

    @objc(removeTasks:)
    @NSManaged public func removeFromTasks(_ values: NSSet)

}


struct UserDTO: Codable {
    
    var id: Int32
    var name: String?
    var username: String?
    var email: String?
    var phone: String?
    var website: String?
    var task: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case username
        case email
        case phone
        case website
        case task
    }
    
}
