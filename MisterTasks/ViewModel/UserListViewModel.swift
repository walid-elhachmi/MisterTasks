//
//  UserViewModel.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 9/30/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import Foundation


protocol UserListViewModelDelegate: NSObject {
    func fetchUsersSuccess()
    func fetchUsersFaileur()
}

class UserListViewModel: NSObject {
    
    weak var delegate: UserListViewModelDelegate?

    private var usersRepository = UserRepository(context: CoreDataManager.shared.managedObjectContext())
    
    private var users: Array<User> {
        
        didSet {
            self.delegate?.fetchUsersSuccess()
        }
    }
    
    init(_ delegate: UserListViewModelDelegate?) {
        
        self.delegate = delegate
        self.users = Array<User>()
    }
    
    func fetchUsers() {
    
        NetworkManager.shared.request(url: API.EndPoint.users) { [weak self]
            (result: Result<[UserDTO], APIError>) in
        
            switch result {
                case .success(let users):
                    CoreDataManager.shared.clearStorage(forEntity: "User")
                    let _ = users.map { userDTO -> Void  in
                        self?.usersRepository.addUser(userDTO: userDTO)
                    }
                    CoreDataManager.shared.saveContext()
                    self?.fetchAllUsersFromDB()
                case .failure(let error):
                    self?.delegate?.fetchUsersFaileur()
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
    
    func fetchUser(by id: Int32) -> User {
        
        let result = self.usersRepository.getUser(by: id)
        
        switch result {
            case .success(let user):
                return user
            case .failure(let error):
                print(error)
                return User()
        }
    }
    
    
    func user(atIndex index: Int) -> UserViewModel {
        return UserViewModel(self.users[index])
    }
    
    func usersCount() -> Int {
        return users.count
    }
    
    
    
}
