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
    @IBOutlet weak var statusIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ userViewModel: TaskViewModel) {
        self.titleLabel.text = userViewModel.title
        self.statusIcon.image = userViewModel.completed ? UIImage(systemName: "checkmark.circle.fill") : UIImage(systemName: "multiply.circle.fill")
        self.statusIcon.tintColor = userViewModel.completed ? .green : .red
    }
    
}
