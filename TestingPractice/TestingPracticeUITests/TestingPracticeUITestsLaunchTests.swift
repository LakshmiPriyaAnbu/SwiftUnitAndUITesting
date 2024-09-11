//
//  TestingPracticeUITestsLaunchTests.swift
//  TestingPracticeUITests
//
//  Created by Lakshmi Priya on 09/09/24.
//This file focuses specifically on testing the launch performance of your application. It is a subset of UI tests that ensures your app launches correctly and performs within acceptable limits.

import XCTest

final class TestingPracticeUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
