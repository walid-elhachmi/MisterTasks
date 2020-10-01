//
//  MisterTasksTests.swift
//  MisterTasksTests
//
//  Created by Walid El Hachmi on 9/30/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import XCTest
@testable import MisterTasks

class MisterTasksTests: XCTestCase {
    
    var userRepository: UserRepository!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        userRepository = UserRepository(context: CoreDataManager.shared.managedObjectContext())
    }

    override func tearDown() {
        CoreDataManager.shared.saveContext()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    
    func testInsertUserFromLocalDatabase() {
        CoreDataManager.shared.clearStorage(forEntity: "User")
        let userDTO = UserDTO.init(id: 11, name: "Walid EL HACHMI", username: "walid.elhachmi", email: "elhachmi.w@gmail.com", phone: "0646777999", website: "www.walid.com", task: nil)
        
        let result = userRepository.addUser(userDTO: userDTO)
        switch result {
        case .success(let success):
            XCTAssertTrue(success)
        case .failure(let error):
            XCTFail(error.localizedDescription)
            
        }
    }
    
    // Excuter ce test apres le test d'insertion
   func testGetUsersInsertedFromLocalDatabase() {
       
       let result = userRepository.getUser(by: 11)
       switch result {
       case .success(let user):
           XCTAssertNotNil(user)
           XCTAssertEqual(user.name, "Walid EL HACHMI")
           XCTAssertEqual(user.username, "walid.elhachmi")
           XCTAssertEqual(user.email, "elhachmi.w@gmail.com")
       case .failure(let error):
           XCTFail(error.localizedDescription)
           
       }
    }

    // Excuter ce test apres la remplissage de la base de donnée local par les utilisateur a travers le webservice
    func testGetUsersFromLocalDatabase() {

        let result = userRepository.getAllUser()
        switch result {
        case .success(let users):
            XCTAssertEqual(users.count, 10)
        case .failure(let error):
            XCTFail(error.localizedDescription)

        }
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
