//
//  TasksViewController.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 9/30/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import UIKit

class TasksViewController: UIViewController {
    
    @IBOutlet weak var tasksTableView: UITableView!
    
    var taskListViewModel: TaskListViewModel!
    
    var user: User? {
        didSet {
            self.taskListViewModel = TaskListViewModel(self)
            self.taskListViewModel.fetchTasksByUser(user: self.user ?? User())
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        

        self.title = "List des tâches".uppercased()
        
        tasksTableView.delegate = self
        tasksTableView.dataSource = self
        
        tasksTableView.rowHeight = 60
        tasksTableView.register(UINib.init(nibName: tasksCellNibName, bundle: nil), forCellReuseIdentifier: reuseIdentifierTaskCell)

    }
    

}

extension TasksViewController: UITableViewDelegate {

}

extension TasksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.taskListViewModel.tasksCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifierTaskCell, for: indexPath) as! TasksTableViewCell
        
        cell.configure(taskListViewModel.task(atIndex: indexPath.row))
        
        return cell
    }
    
    
}


extension TasksViewController: TaskListViewModelDelegate {
    
    func fetchTasksSuccess() {
        DispatchQueue.main.async {
            self.tasksTableView.reloadData()
        }
    }
    
    
}
