//
//  ResumeGeneratorTests.swift
//  ResumeGeneratorTests
//
//  Created by Karthi Samigoundanpalayamshanmugam02 on 11/09/19.
//  Copyright © 2019 Karthi Samigoundanpalayamshanmugam02. All rights reserved.
//

import XCTest
@testable import ResumeGenerator

class ResumeGeneratorTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testResumeInfoView()  {
        let resumeInfoViewController = ResumeInfoViewController()
        //Fetch Data from  local
        resumeInfoViewController.presenterDelegate?.getSavedData()
        //Check if data is present in local data
        XCTAssertNotNil(resumeInfoViewController.resumeInfoModel)
        //Check if URL is working or not
        testValidServiceCall()
        //Check data fetched and parsed successfully
        resumeInfoViewController.presenterDelegate?.getSavedData()
        //Check if data is present From url
        XCTAssertNotNil(resumeInfoViewController.resumeInfoModel)
    }
    
    // Concurrency test
    func testValidServiceCall() {
        let promise = expectation(description: "success case")
        let resumeWebServiceHandler = ServiceHandler()
        guard let url = URL.init(string: Constant().kURL) else { return }
        resumeWebServiceHandler.getResumeInfoFromServer(url: url, completion:({(data:ResumeInfo?, error:Error?) in
            if let resumeInfo = data {
                XCTAssertNotNil(resumeInfo)
                promise.fulfill()
            }else {
                //No data saved in server
                if let error = error{
                    XCTFail("Error: \(error.localizedDescription)")
                }
            }}))
        wait(for: [promise], timeout: 6)
        
    }

}
