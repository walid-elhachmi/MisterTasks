//
//  UserViewModel.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 9/30/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import Foundation


protocol UserListViewModelDelegate: NSObject {
    func parseUsersSuccess()
}

class UserListViewModel: NSObject {
    

    private var usersRepository = UserRepository(context: CoreDataManager.shared.managedObjectContext())
    
    private var users: Array<User> {
        didSet {
            self.delegate?.parseUsersSuccess()
        }
    }
    
    weak var delegate: UserListViewModelDelegate?
    
    init(_ delegate: UserListViewModelDelegate?) {
        self.delegate = delegate
        self.users = Array<User>()
    }
    
    
    func fetchUsers() {
    
        NetworkManager.shared.request(url: API.EndPoint.users) { [weak self]
            (result: Result<[UserDTO], APIError>) in
        
            switch result {
                case .success(let result):
                    CoreDataManager.shared.clearStorage(forEntity: "User")
                    let _ = result.map { userDTO -> Void  in
                        self?.usersRepository.addUser(userDTO: userDTO)
                    }
                    CoreDataManager.shared.saveContext()
                    self?.fetchAllUsersFromDB()
                case .failure(let error):
                    print(error)
            }
            
        }
        
    }
    
    func fetchAllUsersFromDB() {
        let result = self.usersRepository.getAllUser()
        
        switch result {
            case .success(let users):
                self.users = users
            case .failure(let error):
                print(error)
        }
    }
    
    func user(atIndex index: Int) -> UserViewModel {
        return UserViewModel(self.users[index])
    }
    
    func usersCount() -> Int {
        return users.count
    }
    
    
    
}
