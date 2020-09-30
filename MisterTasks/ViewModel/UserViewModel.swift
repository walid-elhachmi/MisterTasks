//
//  UserViewModel.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 9/30/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import Foundation

class UserViewModel: NSObject {
    private var user: User
    init(_ user: User) {
        self.user = user
    }
    
    var id: Int32 {
        return self.user.id
    }
    
    var name: String {
        return self.user.name ?? ""
    }
    
    var username: String {
        return self.user.username ?? ""
    }
    
    var email: String {
        return self.user.email ?? ""
    }
    
    var phone: String {
        return self.user.phone ?? ""
    }
    
    var website: String {
        return self.user.website ?? ""
    }
}
