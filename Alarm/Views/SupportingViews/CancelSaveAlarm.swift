import SwiftUI

struct CancelSaveAlarm: View {
    let currentAlarmIndex: Int?

    @Binding var alarmModel: AlarmModel
    @EnvironmentObject var lnManager: LocalNotificationManager

    @Environment(\.presentationMode) var presentation

    var body: some View {
        HStack {
            Button(action: {
                       print("Cancel")
                       self.presentation
                           .wrappedValue
                           .dismiss()

                   },
                   label:
                   { Text("Cancel") })
            Spacer()
            Button(action: {
                       print("Save")
                       if let currentAlarmIndex = currentAlarmIndex {
                           // Save edited alarm
//                           print("currentAlarmIndex: \(currentAlarmIndex)")
                           lnManager.alarmViewModels[currentAlarmIndex] = alarmModel
                       } else {
                           // Append alarm to view model
                           lnManager.safeAppend(localNotification: alarmModel)
                           print("Append new alarm")
                       }

                       Task {
                           if alarmModel.alarmEnabled {
                               await lnManager.schedule(localNotification: alarmModel)
                           } else {
                               lnManager.removeRequest(id: alarmModel.id)
                           }
                       }

                       self.presentation
                           .wrappedValue
                           .dismiss()
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
            .environmentObject(LocalNotificationManager())
    }
}
