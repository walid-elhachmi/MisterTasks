//
//  UserCollectionViewCell.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 9/30/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import UIKit

let userCellNibName = "UserCollectionViewCell"
let reuseIdentifierUserCell = "UserCollectionViewCell"

protocol UserCollectionViewCellDelegate: AnyObject {
    
    func didTapShowUserTasks(by id: Int32)
}

class UserCollectionViewCell: UICollectionViewCell {
    
    weak var delegate: UserCollectionViewCellDelegate?
    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var userPicture: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var showTasksButton: UIButton!
    
    var id: Int32 = 0

    override func awakeFromNib() {
        super.awakeFromNib()
        
        container.layer.shadowColor = UIColor.lightGray.cgColor
        container.layer.shadowOpacity = 1
        container.layer.shadowOffset = .zero
        container.layer.shadowRadius = 2
        container.layer.cornerRadius = 4
    }

    func configure(_ userViewModel: UserViewModel) {
        self.id = userViewModel.id
        self.nameLabel.text = userViewModel.name
        self.usernameLabel.text = userViewModel.username
        self.emailLabel.text = userViewModel.email
        self.phoneLabel.text = userViewModel.phone
    }
    
    @IBAction func showTasks(_ sender: Any) {
        self.delegate?.didTapShowUserTasks(by: self.id)
    }
    
    
}
