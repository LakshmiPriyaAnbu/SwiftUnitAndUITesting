//
//  PickerView.swift
//  TestingPractice
//
//  Created by Lakshmi Priya on 10/09/24.
//

import SwiftUI

struct PickerView: View {
    @StateObject private var viewModel = PickerViewModel()
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Select Time")
                    .font(.headline)
                    .foregroundColor(.black)
                Spacer()
            }
            .padding(.bottom, 30)
            
            HStack(spacing: 0) {
                Spacer()
                
                Picker("Hours", selection: $viewModel.selectedHours) {
                    ForEach(viewModel.hoursOptions, id: \.self) { hour in
                        Text(hour)
                            .font(.title3)
                            .padding(.vertical, 30)
                            .foregroundColor(hour == viewModel.selectedHours ? .blue : .black)
                            .fontWeight(hour == viewModel.selectedHours ? .bold : .regular)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
                Picker("Minutes", selection: $viewModel.selectedMinutes) {
                    ForEach(viewModel.minutesOptions, id: \.self) { minute in
                        Text(minute)
                            .font(.title3)
                            .padding(.vertical, 30)
                            .foregroundColor(minute == viewModel.selectedMinutes ? .blue : .black)
                            .fontWeight(minute == viewModel.selectedMinutes ? .bold : .regular)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
                Picker("AM/PM", selection: $viewModel.selectedAmPm) {
                    ForEach(viewModel.amPmOptions, id: \.self) { period in
                        Text(period)
                            .font(.title3)
                            .padding(.vertical, 30)
                            .foregroundColor(period == viewModel.selectedAmPm ? .blue : .black)
                            .fontWeight(period == viewModel.selectedAmPm ? .bold : .regular)
                    }
                }
                .pickerStyle(WheelPickerStyle())
                
                Spacer()
            }
            
            Button(action: {
                let selectedTime = viewModel.getSelectedTime()
                  if viewModel.areSelectionsValid() {
                      print("Selected Time: \(selectedTime.hour):\(selectedTime.minute) \(selectedTime.amPm)")
                  } else {
                      print("Invalid selection")
                  }
            }) {
                Text("SET")
                    .font(.body)
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(30)
            }
            .padding(.top, 10)
        }
        .padding()
        .background(Color.white)
    }
}


struct PickerView_Previews: PreviewProvider {
    static var previews: some View {
        PickerView()
    }
}

