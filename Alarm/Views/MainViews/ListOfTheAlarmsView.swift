//
//  ListOfTheAlarmsView.swift
//  Alarm
//
//  Created by Łukasz Modzelewski on 18/06/2023.
//

import SwiftUI

struct ListOfTheAlarmsView: View {
    var alarmViewModels: [AlarmModel]

    var body: some View {
        NavigationStack {
            ZStack {
                List {
                    ForEach(0 ..< alarmViewModels.count, id: \.self) { i in
                        let alarmModel = alarmViewModels[i]
                        NavigationLink(destination: {
                            MainAddEditAlarmView(currentAlarmIndex: i, alarmModel: alarmModel)
                                .tabItem { Label("Alarms", systemImage: "alarm.fill") }
                        }, label: {
                            AlarmRowView(model: alarmModel, i: i)

                        })
                    }
                }

            }.navigationTitle("Alarm list")
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: {
                            MainAddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())

                        }, label: {
                            Text("+")
                                .font(.largeTitle)
                                .fontWeight(.semibold)
                                .foregroundColor(black)

                        })
                    }
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                }
        }
    }
}

struct ListOfTheAlarmsView_Previews: PreviewProvider {
    static var previews: some View {
        ListOfTheAlarmsView(alarmViewModels: AlarmModel.DummyAlarmData())
    }
}
