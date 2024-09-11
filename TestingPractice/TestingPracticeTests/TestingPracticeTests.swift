//
//  TestingPracticeTests.swift
//  TestingPracticeTests
//
//  Created by Lakshmi Priya on 09/09/24.
//
// This file is for writing unit tests. Unit tests are designed to verify that individual components or functions of your application work correctly. These tests focus on the logic and functionality of your code.

import XCTest
@testable import TestingPractice

final class TestingPracticeTests: XCTestCase {
    var viewModel: LoginViewModel!

    override func setUpWithError() throws {
        viewModel = LoginViewModel()
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func testValidName() throws {
        XCTAssertTrue(viewModel.isValidName("John Doe"))
        XCTAssertFalse(viewModel.isValidName(""))
    }
    
    func testValidPhoneNumber() throws {
        XCTAssertTrue(viewModel.isValidPhoneNumber("1234567890"))
        XCTAssertFalse(viewModel.isValidPhoneNumber("12345"))
        XCTAssertFalse(viewModel.isValidPhoneNumber("adhgbhhgvgfgcg"))
       // XCTAssertTrue(viewModel.isValidPhoneNumber("adhgbhhgvgfgcg"))
       
    }
    
    func testValidEmail() throws {
        XCTAssertTrue(viewModel.isValidEmail("test@example.com"))
        XCTAssertFalse(viewModel.isValidEmail("invalid-email"))
    }
    
    func testValidPassword() throws {
        XCTAssertTrue(viewModel.isValidPassword("password123"))
        XCTAssertFalse(viewModel.isValidPassword("12345"))
    }

}
