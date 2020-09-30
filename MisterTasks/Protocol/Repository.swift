//
//  Repository.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 9/30/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import Foundation

protocol Repository {
    
    associatedtype T
    
    func getAll(predicate: NSPredicate?, sortDescriptors: [NSSortDescriptor]?) -> Result<[T], Error>
    func add() -> Result<T, Error>
    
}
