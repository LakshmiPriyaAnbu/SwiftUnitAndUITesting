//
//  PickerViewTests.swift
//  TestingPracticeUITests
//
//  Created by Lakshmi Priya on 10/09/24.
//

import XCTest


final class PickerViewUiTeste: XCTestCase{
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func navigateToPickerView() {
        let pickerTab = app.tabBars.buttons["Picker"]
        XCTAssertTrue(pickerTab.exists)
                pickerTab.tap()

    }
    
    func testPickerViewUIElements() throws {
        navigateToPickerView()
            let pickerTab = app.tabBars.buttons["Picker"]
            XCTAssertTrue(pickerTab.exists, "Picker tab does not exist")
            pickerTab.tap()
            
            // Check if the title "Select Time" exists
            let selectTimeTitle = app.staticTexts["Select Time"]
            XCTAssertTrue(selectTimeTitle.exists, "The 'Select Time' title is not present")
            
            // Check if the "Hours" picker exists
            let hoursPicker = app.pickers["Hours"]
            XCTAssertTrue(hoursPicker.exists, "The 'Hours' picker is not present")

            // Check if the "Minutes" picker exists
            let minutesPicker = app.pickers["Minutes"]
            XCTAssertTrue(minutesPicker.exists, "The 'Minutes' picker is not present")

          
            let amPmPicker = app.pickers["AM/PM"]
            XCTAssertTrue(amPmPicker.exists, "The 'AM/PM' picker is not present")
            
            
            let setButton = app.buttons["SET"]
            XCTAssertTrue(setButton.exists, "The 'SET' button is not present")
        }
    
    func testPickerSelection() throws {
            navigateToPickerView()
            
            let hoursPicker = app.pickerWheels.element(boundBy: 0)
            XCTAssertTrue(hoursPicker.exists)
            hoursPicker.adjust(toPickerWheelValue: "6")
            
       
            let minutesPicker = app.pickerWheels.element(boundBy: 1)
            XCTAssertTrue(minutesPicker.exists)
            minutesPicker.adjust(toPickerWheelValue: "45")
            
      
            let amPmPicker = app.pickerWheels.element(boundBy: 2)
            XCTAssertTrue(amPmPicker.exists)
            amPmPicker.adjust(toPickerWheelValue: "PM")
            
          
            let setTimeButton = app.buttons["SET"]
            XCTAssertTrue(setTimeButton.exists)
            setTimeButton.tap()
            
        }
    
    func testInvalidValuesAreNotSelectable() {
            XCTAssertFalse(app.pickerWheels["13"].exists)

            XCTAssertFalse(app.pickerWheels["60"].exists)

            XCTAssertFalse(app.pickerWheels["XX"].exists)
        }
    
}

