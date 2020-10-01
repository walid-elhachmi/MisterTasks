//
//  MisterTasksUITests.swift
//  MisterTasksUITests
//
//  Created by Walid El Hachmi on 9/30/20.
//  Copyright © 2020 Walid. All rights reserved.
//

import XCTest

class MisterTasksUITests: XCTestCase {

    let app = XCUIApplication()
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
        app.launch()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func test_user_experience_of_getting_data_from_webService() {
        
        app.collectionViews.children(matching: .cell).element(boundBy: 0).buttons["Ses Tâches"].tap()
        app.tables.children(matching: .cell).element(boundBy: 0).swipeLeft()
        
    }
    
    func test_user_experience_of_getting_data_from_local_database() {
         
        app.alerts["Probléme de connexion"].scrollViews.otherElements.buttons["OUI"].tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).buttons["Ses Tâches"].tap()
        
        app.tables.children(matching: .cell).element(boundBy: 0).swipeLeft()

                
         
     }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
