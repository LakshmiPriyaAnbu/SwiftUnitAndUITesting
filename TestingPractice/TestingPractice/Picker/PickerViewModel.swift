//
//  PickerViewModel.swift
//  TestingPractice
//
//  Created by Lakshmi Priya on 10/09/24.
//

import SwiftUI

class PickerViewModel: ObservableObject {
    @Published var selectedHours: String
    @Published var selectedMinutes: String
    @Published var selectedAmPm: String
    
    let hoursOptions: [String]
    let minutesOptions: [String]
    let amPmOptions: [String]
    
    init() {
        self.selectedHours = "10"
        self.selectedMinutes = "10"
        self.selectedAmPm = "AM"
        
        self.hoursOptions = Array(1...12).map { "\($0)" }
        self.minutesOptions = Array(0...59).map { String(format: "%02d", $0) }
        self.amPmOptions = ["AM", "PM"]
    }
    
    func isValidHour(_ hour: String) -> Bool {
        return hoursOptions.contains(hour)
    }
    
    func isValidMinute(_ minute: String) -> Bool {
        return minutesOptions.contains(minute)
    }
    
    func isValidAmPm(_ period: String) -> Bool {
        return amPmOptions.contains(period)
    }
    func getSelectedTime() -> (hour: String, minute: String, amPm: String) {
          return (selectedHours, selectedMinutes, selectedAmPm)
      }
      
      func areSelectionsValid() -> Bool {
          return isValidHour(selectedHours) && isValidMinute(selectedMinutes) && isValidAmPm(selectedAmPm)
      }
    
}

