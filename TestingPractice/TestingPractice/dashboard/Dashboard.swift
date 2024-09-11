//
//  Dashboard.swift
//  TestingPractice
//
//  Created by Lakshmi Priya on 10/09/24.
//

import SwiftUI

struct Dashboard: View {
    var body: some View {
        TabView {
            LoginPage()
                .tabItem {
                    Label("Login", systemImage: "person.crop.circle.fill")
                }
            
            PickerView()
                .tabItem {
                    Label("Picker", systemImage: "clock")
                }
        }
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
