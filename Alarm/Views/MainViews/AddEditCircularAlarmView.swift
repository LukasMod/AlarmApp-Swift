//
//  AddEditCircularAlarmView.swift
//  Alarm
//
//  Created by Łukasz Modzelewski on 18/06/2023.
//

import SwiftUI

struct AddEditCircularAlarmView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel

    var body: some View {
        VStack {
            CancelSaveAlarm(currentAlarmIndex: currentAlarmIndex, alarmModel: $alarmModel)
            AlarmToggleView(alarmEnabled: $alarmModel.alarmEnabled)

            Divider()
            Spacer()

            CircularTimeView(currentAlarmIndex: currentAlarmIndex, alarmModel: alarmModel, size: screenWidth / 2)

            Spacer()
            
            SelectActivityViewExpended(currentColorIndex: $alarmModel.colorIndex, currentActivity: $alarmModel.activity)
            
            Spacer()
        }.padding()
    }
}

struct AddEditCircularAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AddEditCircularAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
    }
}
