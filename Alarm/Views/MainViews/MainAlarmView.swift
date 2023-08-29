
import SwiftUI

struct MainAlarmView: View {
    @EnvironmentObject var lnManager: LocalNotificationManager

    // Every time the scene phase changes this will update
    @Environment(\.scenePhase) var scenePhase
    var body: some View {
        TabView {
            if lnManager.isAuthorized {
                ListOfTheAlarmsView()
                    .tabItem { Label("Alarms", systemImage: "alarm.fill") }

                AboutView()
                    .tabItem { Label("About", systemImage: "info.circle.fill") }
            } else {
                EnableNotifications()
            }
        }
        .ignoresSafeArea()
        .task {
            try? await lnManager.requestAuthorization()
        }
        .onChange(of: scenePhase){ newValue in
            if newValue == .active {
                Task {
                    await lnManager.getCurrentSettings()
                    await lnManager.getPendingAlarms()
                }
            }
        }
    }
}

struct MainAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        MainAlarmView()
            .environmentObject(LocalNotificationManager())
    }
}
