//
//  TasksTableViewCell.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 9/30/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import UIKit

let tasksCellNibName = "TasksTableViewCell"
let reuseIdentifierTaskCell = "TasksTableViewCell"

class TasksTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ userViewModel: TaskViewModel) {
           self.titleLabel.text = userViewModel.title
       }
    
}
