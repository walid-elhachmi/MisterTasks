//
//  Config.swift
//  MisterTasks
//
//  Created by Walid El Hachmi on 9/30/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import Foundation


public enum API {
    
    static let baseURL = "https://jsonplaceholder.typicode.com/"
    
    enum EndPoint {
        
        static let users = "users/"
        static let tasks = ""
    }
    
}


public enum APIError: Error {
    
    case connection(Error)
    case invalidEndPoint
    case invalidResponse
    case decodeError
}
