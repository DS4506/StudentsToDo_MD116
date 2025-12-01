//
//  StudentsToDoUITests.swift
//  StudentsToDoUITests
//
//  Created by SDGKU on 10/11/25.
//

import XCTest

final class ProfessorToDoUITests: XCTestCase {

    func testAddNewGroup() throws {
        let app = XCUIApplication()
        app.launch()

        app.buttons["school_data"].tap()

        app.buttons["manageGroupsButton"].tap()
        
        let newGroupField = app.textFields["newGroupNameTextField"]
        newGroupField.tap()
        newGroupField.typeText("Work Projects")
        
        app.buttons["addNewGroupButton"].tap()
        
        app.buttons["Done"].tap()
        
        XCTAssertTrue(app.staticTexts["Work Projects"].exists)
    }
}
