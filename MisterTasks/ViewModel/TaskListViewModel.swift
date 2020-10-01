//
//  TaskListViewModel.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 10/1/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import Foundation

protocol TaskListViewModelDelegate: NSObject {
    func fetchTasksSuccess()
}

class TaskListViewModel: NSObject {
    

    private var tasksRepository = TasksRepository(context: CoreDataManager.shared.managedObjectContext())
    
    private var tasks: Array<Tasks> {
        didSet {
            self.delegate?.fetchTasksSuccess()
        }
    }
    
    weak var delegate: TaskListViewModelDelegate?
    
    init(_ delegate: TaskListViewModelDelegate?) {
        self.delegate = delegate
        self.tasks = Array<Tasks>()
    }
    
    
    func fetchTasksByUser(user: User) {

        NetworkManager.shared.request(url: "\(API.EndPoint.tasks)=\(user.id)") {
            (result: Result<[TasksDTO], APIError>) in
        
            switch result {
                case .success(let tasks):
                    let _ = tasks.map { taskDTO -> Void  in
                        self.tasksRepository.addTaskToUser(user: user, tasksDTO: taskDTO)
                    }
                    CoreDataManager.shared.saveContext()
                print(result)
                case .failure(let error):
                    print(error)
            }
                    
        }
        
        self.tasks = user.tasks?.allObjects as! Array<Tasks>
        
    }
    
    
    
    func task(atIndex index: Int) -> TaskViewModel {
        return TaskViewModel(self.tasks[index])
    }
    
    func tasksCount() -> Int {
        return tasks.count
    }
    
    
    
}



