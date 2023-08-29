import SwiftUI

struct AddEditAlarmView: View {
    let currentAlarmIndex: Int?
    @EnvironmentObject var lnManager: LocalNotificationManager

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

                if let currentAlarmIndex = currentAlarmIndex {
                    ToBedWakeUpView(currentAlarmIndex: currentAlarmIndex, alarmModel: lnManager.alarmViewModels[currentAlarmIndex])
                } else {
                    ToBedWakeUpView(currentAlarmIndex: currentAlarmIndex, alarmModel: .DefaultAlarm())
                }
                
              
            }
        }
        .onAppear {
            DispatchQueue.main
                .asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                        showYouDidItView = false
                    }
                }
        }
    }
}

struct AddEditAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        AddEditAlarmView(currentAlarmIndex: nil)
            .environmentObject(LocalNotificationManager())
    }
}
