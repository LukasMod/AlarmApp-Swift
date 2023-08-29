
import SwiftUI

struct MainAddEditAlarmView: View {
    let currentAlarmIndex: Int?
    @State var alarmModel: AlarmModel
    @State private var selectedTab = "One"

    var body: some View {
        TabView(selection: $selectedTab) {
            AddEditAlarmView(currentAlarmIndex: currentAlarmIndex).tag("One")
            AddEditCircularAlarmView(currentAlarmIndex: currentAlarmIndex, alarmModel: alarmModel).tag("Two")
        }
        .onAppear {
            UIPageControl
                .appearance()
                .currentPageIndicatorTintColor = .gray
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .ignoresSafeArea()
    }
}

struct MainAddEditView_Previews: PreviewProvider {
    static var previews: some View {
        MainAddEditAlarmView(currentAlarmIndex: nil, alarmModel: .DefaultAlarm())
    }
}
