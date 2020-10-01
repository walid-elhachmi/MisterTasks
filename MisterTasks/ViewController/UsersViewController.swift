//
//  UsersViewController.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 9/30/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import UIKit

class UsersViewController: UIViewController {
    
    @IBOutlet weak var usersCollectionView: UICollectionView!
    
    var userListViewModel: UserListViewModel!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "List des Utilisateurs".uppercased()
        self.userListViewModel = UserListViewModel(self)
        self.userListViewModel.fetchUsers()
        
        usersCollectionView.delegate = self
        usersCollectionView.dataSource = self
        
        usersCollectionView.register(UINib(nibName: userCellNibName, bundle: nil), forCellWithReuseIdentifier: reuseIdentifierUserCell)

    }
    
}


extension UsersViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // 1. request an UITraitCollection instance
        let deviceIdiom = UIScreen.main.traitCollection.userInterfaceIdiom

        // 2. check the idiom
        switch (deviceIdiom) {

        case .pad:
            return CGSize(width: (UIScreen.main.bounds.size.width - 40) / 2, height: 260)
        default:
            return CGSize(width: UIScreen.main.bounds.size.width, height: 260)
        }
        
        
    }
    
}

extension UsersViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.userListViewModel.usersCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifierUserCell, for: indexPath) as! UserCollectionViewCell
        
        let userViewModel = self.userListViewModel.user(atIndex: indexPath.row)
        cell.delegate = self
        cell.configure(userViewModel)
        
        
        return cell
        
    }
    
}

extension UsersViewController: UserListViewModelDelegate {
    
    func fetchUsersFaileur() {
        
        DispatchQueue.main.async { [unowned self] in
            
            let alertController = UIAlertController(title: "Probléme de connexion", message: "Voulez vous continuer par les données local", preferredStyle: .alert)

            let okAction = UIAlertAction(title: "OUI", style: .default) {
                UIAlertAction in

                self.userListViewModel.fetchAllUsersFromDB()
            }
            
            let cancelAction = UIAlertAction(title: "NON", style: .cancel, handler: nil)
            
            alertController.addAction(okAction)
            alertController.addAction(cancelAction)
            
            self.present(alertController, animated: true, completion: nil)
        }
        
        
    }
    
    func fetchUsersSuccess() {
        
        DispatchQueue.main.async { [unowned self] in
            
            self.usersCollectionView.reloadData()
        }
    }
    
}

extension UsersViewController: UserCollectionViewCellDelegate {
    
    func didTapShowUserTasks(by id: Int32) {
        
        let taskVC : TasksViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "TasksViewController") as! TasksViewController
        
        taskVC.user = self.userListViewModel.fetchUser(by: id)
        self.present(taskVC, animated: true, completion: nil)
    }
    
    
}


