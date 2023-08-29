import SwiftUI

struct AlarmRowView: View {
    @EnvironmentObject var lnManager: LocalNotificationManager

    let model: AlarmModel
    let i: Int

    var body: some View {
        HStack {
            Image(systemName: model.activity)
                .foregroundColor(model.activityColor)
                .font(.title)

            Text("\(getTimeFromDate(date: model.start))-\(getTimeFromDate(date: model.end))")
                .font(.title)
                .fontWeight(model.alarmEnabled ? .regular : .thin)
                .scaleEffect(model.alarmEnabled ? 1.05 : 1.0)
                .opacity(model.alarmEnabled ? 1.0 : 0.7)
            Spacer()

            // TODO: Changed later

            if i < lnManager.alarmViewModels.count {
                TheToggleView(isOn: .constant(lnManager.alarmViewModels[i].alarmEnabled))
            }

//            let alarmViewModels = AlarmModel.DummyAlarmData()
//            TheToggleView(isOn: .constant(alarmViewModels[i].alarmEnabled))
        }
        .onChange(of: model.alarmEnabled) {
            alarmEnabled in
            if alarmEnabled {
                print("Enable alarm")
                // TODO: Enable alarm
                // TODO: Need Schedule function

                Task {
                    await lnManager.schedule(localNotification: model)
                }

            } else {
                print("Disable alarm")

                lnManager.removeRequest(id: model.id)

                // TODO: Disable alarm
                // TODO: Remove request
            }
        }
    }
}

struct AlarmRowView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmRowView(model: .DefaultAlarm(), i: 0)
            .environmentObject(LocalNotificationManager())
    }
}
