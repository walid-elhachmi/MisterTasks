//
//  TasksRepository.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 10/1/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import Foundation
import CoreData

protocol TasksInterfaceRepository {
    
    func addTaskToUser(user: User, tasksDTO: TasksDTO) -> Result<Bool, Error>
}

class TasksRepository: TasksInterfaceRepository {
    
    
    private let repository: CoreDataRepository<Tasks>

    init(context: NSManagedObjectContext) {
        self.repository = CoreDataRepository.init(managedObjectContext: context)
    }
    
    
    @discardableResult func addTaskToUser(user: User, tasksDTO: TasksDTO) -> Result<Bool, Error> {
        let result = self.repository.add()
        switch result {
            case .success(let task):
                task.id = tasksDTO.id
                task.userId = tasksDTO.userId
                task.title = tasksDTO.title
                task.completed = tasksDTO.completed
                user.addToTasks(task)
                print(user)
                return (.success(true))
            case .failure(let error):
                print(error.localizedDescription)
                return (.failure(error))
        }
    }
    
    
    
}
