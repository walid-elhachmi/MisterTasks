//
//  TaskViewModel.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 9/30/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import Foundation

class TaskViewModel: NSObject {
    
    private var task: Tasks
    
    init(_ task: Tasks) {
        self.task = task
    }
    
    var id: Int32 {
        return self.task.id
    }
    
    var userId: Int32 {
        return self.task.userId
    }
    
    var title: String {
        return self.task.title ?? ""
    }
    
    var completed: Bool {
        return self.task.completed
    }
    
}
