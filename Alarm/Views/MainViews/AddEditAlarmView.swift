//
//  AddEditAlarmView.swift
//  Alarm
//
//  Created by Łukasz Modzelewski on 31/05/2023.
//

import SwiftUI

struct AddEditAlarmView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    @State private var showYouDidItView = true

    var body: some View {
        ZStack {
            backgroundColor
                .opacity(0.7)
                .ignoresSafeArea()

            VStack {
                if showYouDidItView {
                    YouDidItView()
                }

                ToBedWakeUpView(currentAlarmIndex: currentAlarmIndex, alarmModel: alarmModel)
            }
        }
        .onAppear {
            DispatchQueue.main
                .asyncAfter(deadline: .now() + 3.0) {
                    withAnimation {
                        showYouDidItView = false
                    }
                }
        }
    }
}

struct AddEditAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
    }
}
