
import SwiftUI

struct EnableNotifications: View {
    
    @EnvironmentObject var lnManager: LocalNotificationManager
    
    var body: some View {
        ZStack {
            FourCoolCircles()
            VStack {
                Spacer()
                CoolTextView(text: "Enable notifications, please", size: 48)
                    .multilineTextAlignment(.center)
                Spacer()
                Button(action: {
                    lnManager.openSettings()
                }, label:{
                    ButtonView(text: LocalizedStringKey("enable"))
                        .padding()
                })
            }
        }
    }
}

struct EnableNotifications_Previews: PreviewProvider {
    static var previews: some View {
        EnableNotifications()
            .environmentObject(LocalNotificationManager())
    }
}
