//
//  TestingPracticeUITests.swift
//  TestingPracticeUITests
//
//  Created by Lakshmi Priya on 09/09/24.
//This file is dedicated to UI tests. UI tests ensure that the user interface elements of your application function as expected. They interact with the app's user interface and check whether the app behaves correctly from the user's perspective.

import XCTest

final class TestingPracticeUITests: XCTestCase {
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
        // Clean up code if needed
    }
    
    func testAppSupportsOnlyPortraitOrientation() throws {
        XCUIDevice.shared.orientation = .portrait
        
        // Check if the UI elements exist and are in the correct orientation
        XCTAssertTrue(app.textFields["Name"].exists)
        XCTAssertTrue(app.textFields["Phone Number"].exists)
        XCTAssertTrue(app.textFields["Email"].exists)
        XCTAssertTrue(app.secureTextFields["Password"].exists)
        
        // Set orientation to landscape (unsupported)
        XCUIDevice.shared.orientation = .landscapeRight
        
        // Ensure the app does not display in landscape (or handles it appropriately)
        // Check if the app layout still meets portrait orientation expectations
        XCTAssertTrue(app.textFields["Name"].exists)
        XCTAssertTrue(app.textFields["Phone Number"].exists)
        XCTAssertTrue(app.textFields["Email"].exists)
        XCTAssertTrue(app.secureTextFields["Password"].exists)
        
        // Optionally, you can verify specific layout conditions for unsupported orientations
    }
    
    func testAppHandlesUnsupportedOrientationGracefully() throws {
        app.launch()
        
        // Set orientation to portrait
        XCUIDevice.shared.orientation = .portrait
        
        // Set orientation to landscape (unsupported)
        XCUIDevice.shared.orientation = .landscapeRight
        
        
        XCTAssertTrue(app.textFields["Name"].exists)
        XCTAssertTrue(app.textFields["Phone Number"].exists)
        XCTAssertTrue(app.textFields["Email"].exists)
        XCTAssertTrue(app.secureTextFields["Password"].exists)
    }

    func testLoginPageFieldsExist() throws {
    
        app.launch()

        
        let nameTextField = app.textFields["Name"]
        let phoneNumberTextField = app.textFields["Phone Number"]
        let emailTextField = app.textFields["Email"]
        let passwordSecureField = app.secureTextFields["Password"]

        if !nameTextField.exists {
            scrollToElement(element: nameTextField)
        }
        if !phoneNumberTextField.exists {
            scrollToElement(element: phoneNumberTextField)
        }
        if !emailTextField.exists {
            scrollToElement(element: emailTextField)
        }
        if !passwordSecureField.exists {
            scrollToElement(element: passwordSecureField)
        }

        XCTAssertTrue(nameTextField.exists)
        XCTAssertTrue(phoneNumberTextField.exists)
        XCTAssertTrue(emailTextField.exists)
        XCTAssertTrue(passwordSecureField.exists)
    }

    func testSubmitButton() throws {
     
        app.launch()

   
        let submitButton = app.buttons["Submit"]
        XCTAssertTrue(submitButton.exists)
        submitButton.tap()

    }
    
    func testSubmitButtonWithValidInputs() throws {
     
        app.launch()
        

        let nameField = app.textFields["Name"]
        let phoneField = app.textFields["Phone Number"]
        let emailField = app.textFields["Email"]
        let passwordField = app.secureTextFields["Password"]
        
        nameField.tap()
        nameField.typeText("John Doe")
        
        phoneField.tap()
        phoneField.typeText("1234567890")
        
        emailField.tap()
        emailField.typeText("john.doe@example.com")
        
        passwordField.tap()
        passwordField.typeText("securePassword123")
        
    
        let submitButton = app.buttons["Submit"]
        submitButton.tap()
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }

    // Utility function to scroll to an element
    func scrollToElement(element: XCUIElement) {
        let existsPredicate = NSPredicate(format: "exists == true")
        expectation(for: existsPredicate, evaluatedWith: element, handler: nil)
        waitForExpectations(timeout: 5, handler: nil)
    }
}
