//
//  loginPage.swift
//  swiftui testing
//
//  Created by Lakshmi Priya on 09/09/24.
//

import SwiftUI

struct LoginPage: View {
    @StateObject private var viewModel = LoginViewModel()
    @State private var name: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var phoneNumber: String = ""
    
    var body: some View {
        //ScrollView(showsIndicators: false){
            VStack(spacing: 20) {
                Text("Login")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
                
                TextField("Name", text: $name)
                    .accessibility(identifier: "Name")
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                
                TextField("Phone Number", text: $phoneNumber)
                    .accessibility(identifier: "Phone Number")
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                
                TextField("Email", text: $email)
                    .accessibility(identifier: "Email")                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding(.horizontal, 20)
                
                SecureField("Password", text: $password)
                    .accessibility(identifier: "Password")
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal, 20)
                
                Button(action: {
                    print("Name: \(name), Email: \(email), Password: \(password)")
                    if viewModel.isValidName(name) && viewModel.isValidEmail(email) && viewModel.isValidPassword(password) {
                        print("Form is valid")
                    } else {
                        print("Form is invalid")
                    }
                }) {
                    Text("Submit")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                        .padding(.horizontal, 20)
                }
                
                Spacer()
            }
            .padding(.top, 50)
       // }
        
    }
}

#Preview {
    LoginPage()
}
