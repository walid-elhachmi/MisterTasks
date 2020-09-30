//
//  UserRepository.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 9/30/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import Foundation
import CoreData

protocol UserInterfaceRepository {
    
    func getAllUser() -> Result<[User], Error>
    func addUser(userDTO: UserDTO) -> Result<Bool, Error>
}

class UserRepository: UserInterfaceRepository {

    
    
    private let repository: CoreDataRepository<User>

    init(context: NSManagedObjectContext) {
        self.repository = CoreDataRepository.init(managedObjectContext: context)
    }
    
    
    @discardableResult func getAllUser() -> Result<[User], Error> {
        // Trier les Utilisateur par leur identifiant
        let sortById = [NSSortDescriptor(key: "id", ascending: true)]
        let result = repository.getAll(predicate: nil, sortDescriptors: sortById)
        switch result {
        case .success(let user):
            return .success(user)
        case .failure(let error):
            return .failure(error)
        }
    }
    
    @discardableResult func addUser(userDTO: UserDTO) -> Result<Bool, Error> {
        
        let result = self.repository.add()
        switch result {
            case .success(let user):
                user.id = userDTO.id
                user.name = userDTO.name
                user.username = userDTO.username
                user.email = userDTO.email
                user.phone = userDTO.phone
                user.website = userDTO.website
                print(user)
                return (.success(true))
            case .failure(let error):
                print(error.localizedDescription)
                return (.failure(error))
        }
    }
    
    
}
