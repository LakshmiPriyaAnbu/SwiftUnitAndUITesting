//
//  PickerViewUnitTests.swift
//  TestingPracticeTests
//
//  Created by Lakshmi Priya on 10/09/24.
//

import XCTest
@testable import TestingPractice

final class PickerViewUnitTests: XCTestCase{
    
    func testInitialValues() {
            let viewModel = PickerViewModel()
            
            XCTAssertEqual(viewModel.selectedHours, "10", "Initial hours should be 12")
            XCTAssertEqual(viewModel.selectedMinutes, "10", "Initial minutes should be 00")
            XCTAssertEqual(viewModel.selectedAmPm, "AM", "Initial period should be AM")
        }

        func testValidHourSelection() {
            let viewModel = PickerViewModel()
            
            XCTAssertTrue(viewModel.isValidHour("8"), "8 should be a valid hour")
            XCTAssertFalse(viewModel.isValidHour("13"), "13 should be an invalid hour")
        }

        func testValidMinuteSelection() {
            let viewModel = PickerViewModel()
            
            XCTAssertTrue(viewModel.isValidMinute("45"), "45 should be a valid minute")
            XCTAssertFalse(viewModel.isValidMinute("60"), "60 should be an invalid minute")
        }

        func testValidAmPmSelection() {
            let viewModel = PickerViewModel()
            
            XCTAssertTrue(viewModel.isValidAmPm("AM"), "AM should be valid")
            XCTAssertTrue(viewModel.isValidAmPm("PM"), "PM should be valid")
            XCTAssertFalse(viewModel.isValidAmPm("XX"), "XX should be invalid")
        }
    
    func testSetButtonAction() {
            let viewModel = PickerViewModel()
            
            // Simulate user selecting values
            viewModel.selectedHours = "10"
            viewModel.selectedMinutes = "30"
            viewModel.selectedAmPm = "PM"
            
            // Simulate tapping "SET" button
            let selectedTime = viewModel.getSelectedTime()
            
            // Check that the values are not null/undefined and fall within valid ranges
            XCTAssertNotNil(selectedTime.hour, "Hour should not be nil")
            XCTAssertNotNil(selectedTime.minute, "Minute should not be nil")
            XCTAssertNotNil(selectedTime.amPm, "AM/PM should not be nil")
            
            XCTAssertTrue(viewModel.isValidHour(selectedTime.hour), "Hour should be valid")
            XCTAssertTrue(viewModel.isValidMinute(selectedTime.minute), "Minute should be valid")
            XCTAssertTrue(viewModel.isValidAmPm(selectedTime.amPm), "AM/PM should be valid")
        }
    
    func testValidSelectedValues() {
        let viewModel = PickerViewModel()
        
        // Simulate selecting valid values
        viewModel.selectedHours = "9"
        viewModel.selectedMinutes = "45"
        viewModel.selectedAmPm = "AM"
        
        // Ensure the selections are valid
        XCTAssertTrue(viewModel.areSelectionsValid(), "Selections should be valid")
    }
    
    // Test invalid selections
    func testInvalidSelectedValues() {
        let viewModel = PickerViewModel()
        
        // Simulate selecting an invalid hour, minute, and AM/PM
        viewModel.selectedHours = "13" // Invalid
        viewModel.selectedMinutes = "60" // Invalid
        viewModel.selectedAmPm = "XX" // Invalid
        
        // Ensure the selections are invalid
        XCTAssertFalse(viewModel.areSelectionsValid(), "Selections should be invalid")
    }

    
}
