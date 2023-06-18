//
//  EnableNotifications.swift
//  Alarm
//
//  Created by Łukasz Modzelewski on 30/05/2023.
//

import SwiftUI

struct EnableNotifications: View {
    var body: some View {
        ZStack {
            FourCoolCircles()
            VStack {
                Spacer()
                CoolTextView(text: "Enable notifications, please", size: 48)
                    .multilineTextAlignment(.center)
                Spacer()
                Button(action: {
                    print("TODO: Enable")
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
    }
}
