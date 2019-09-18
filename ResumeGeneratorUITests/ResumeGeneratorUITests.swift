//
//  ResumeGeneratorUITests.swift
//  ResumeGeneratorUITests
//
//  Created by Karthi Samigoundanpalayamshanmugam02 on 11/09/19.
//  Copyright © 2019 Karthi Samigoundanpalayamshanmugam02. All rights reserved.
//

import XCTest

class ResumeGeneratorUITests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

        func testResumeInfo() {
            
            let app = XCUIApplication()
            app.buttons["Create New Resume"].tap()
            
            let tablesQuery = app.tables
            let personalInfo = tablesQuery.staticTexts["Personal Information"]
            personalInfo.tap()
            let firstName = app.tables.textFields["First Name"]
            firstName.tap()
            firstName.typeText("Karthi")
            
            let lastName = app.tables.textFields["Last Name"]
            lastName.tap()
            lastName.typeText("Shanmugam")
            
            let email = app.tables.textFields["Email Id"]
            email.tap()
            email.typeText("karthi@gmail.com")
            
            let mobileNumber = app.tables.textFields["Mobile Number"]
            mobileNumber.tap()
            mobileNumber.typeText("9840855875")
            
            let address1 = app.tables.textFields["Address Line1"]
            address1.tap()
            address1.typeText("25 West St")
            
            let address2 = app.tables.textFields["Address Line2"]
            address2.tap()
            address2.typeText("chennai")
            
            let dob = app.tables.textFields["DOB (DD-MM-YYYY)"]
            dob.tap()
            dob.typeText("19-Jun-1987")
            
            let currentCompany = app.tables.textFields["Current Company"]
            currentCompany.tap()
            currentCompany.typeText("Infosys")
            
            let exp = app.tables.textFields["Experience in Years"]
            exp.tap()
            exp.typeText("9")
            
            let skillSet = app.tables.textFields["Skill Set"]
            skillSet.tap()
            skillSet.typeText("iOS")
        
            let primaryEducation = app.tables.textFields["Primary Education Marks"]
            primaryEducation.tap()
            primaryEducation.typeText("87")
            
            let secondaryEducation = app.tables.textFields["Secondary Education Marks"]
            secondaryEducation.tap()
            secondaryEducation.typeText("84")
            
            let higherEducation = app.tables.textFields["Higher Education Marks"]
            higherEducation.tap()
            higherEducation.typeText("86")
          
            app.navigationBars["Personal Information"].buttons["Preview"].tap()
           
            
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

}
