//
//  LoginViewModel.swift
//  TestingPractice
//
//  Created by Lakshmi Priya on 09/09/24.
//

import Foundation

class LoginViewModel: ObservableObject {
    func isValidName(_ name: String) -> Bool {
        return !name.isEmpty
    }
    
    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
            let phoneRegex = "^[0-9]{10}$" 
            let phonePred = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
            return phonePred.evaluate(with: phoneNumber)
        }
    
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegex)
        return emailPred.evaluate(with: email)
    }
    
    func isValidPassword(_ password: String) -> Bool {
        return password.count >= 6
    }
}

