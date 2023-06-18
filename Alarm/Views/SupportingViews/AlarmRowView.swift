import SwiftUI

struct AlarmRowView: View {
    let model: AlarmModel
    let i: Int

    var body: some View {
        HStack {
            Image(systemName: model.activity)
                .foregroundColor(model.activityColor)
                .font(.title)

            Text("\(getTimeFromDate(date: model.end))")
                .font(.title)
                .fontWeight(model.alarmEnabled ? .regular : .thin)
                .scaleEffect(model.alarmEnabled ? 1.05 : 1.0)
                .opacity(model.alarmEnabled ? 1.0 : 0.7)
            Spacer()

            // TODO: Changed later
            let alarmViewModels = AlarmModel.DummyAlarmData()

            TheToggleView(isOn: .constant(alarmViewModels[i].alarmEnabled))
        }
    }
}

struct AlarmRowView_Previews: PreviewProvider {
    static var previews: some View {
        AlarmRowView(model: .DefaultAlarm(), i: 0)
    }
}
