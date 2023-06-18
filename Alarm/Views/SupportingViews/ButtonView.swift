//
//  ButtonView.swift
//  Alarm
//
//  Created by Łukasz Modzelewski on 30/05/2023.
//

import SwiftUI

struct ButtonView: View {
    let text: LocalizedStringKey
    var endRadius = 40.0
    var scaleX = 3.0

    var body: some View {
        Text(text)
            .foregroundColor(black)
            .fontWeight(.semibold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                MainGradient(endRadius: endRadius, scaleX: scaleX)
            )
            .cornerRadius(30)
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ButtonView(text: "Add Alarm")
            ButtonView(text: "No Alarms")
            ButtonView(text: "create")
        }.padding()
    }
}
