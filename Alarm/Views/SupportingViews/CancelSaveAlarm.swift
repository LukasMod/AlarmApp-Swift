//
//  CancelSaveAlarm.swift
//  Alarm
//
//  Created by Łukasz Modzelewski on 18/06/2023.
//

import SwiftUI

struct CancelSaveAlarm: View {
    let currentAlarmIndex: Int?

    @Binding var alarmModel: AlarmModel

    var body: some View {
        HStack {
            Button(action: {
                       print("Cancel")
                   },
                   label:
                   { Text("Cancel") })
            Spacer()
            Button(action: {
                       print("Save")
                       if let currentAlarmIndex = currentAlarmIndex {
                           // Edit alarm to view model
                           print("currentAlarmIndex: \(currentAlarmIndex)")
                       } else {
                           // Append alarm to view model
                           print("Append new alarm")
                       }
                   },
                   label: {
                       Text("Save")
                   })
        }
    }
}

struct CancelSaveAlarm_Previews: PreviewProvider {
    static var previews: some View {
        CancelSaveAlarm(currentAlarmIndex: nil, alarmModel: .constant(.DefaultAlarm()))
    }
}
