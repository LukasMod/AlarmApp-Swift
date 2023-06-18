//
//  ContentView.swift
//  Alarm
//
//  Created by Łukasz Modzelewski on 30/05/2023.
//

import SwiftUI

struct MainAlarmView: View {
    var body: some View {
        TabView {
//            AddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
//                .tabItem { Label("Alarms", systemImage: "alarm.fill") }

            ListOfTheAlarmsView(alarmViewModels: AlarmModel.DummyAlarmData())
                .tabItem { Label("Alarms", systemImage: "alarm.fill") }

            AboutView()
                .tabItem { Label("About", systemImage: "info.circle.fill") }
        }
    }
}

struct MainAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        MainAlarmView()
    }
}
