//
//  CentralDatePickerVIew.swift
//  Alarm
//
//  Created by Łukasz Modzelewski on 18/06/2023.
//

import SwiftUI

struct CentralDatePickerView: View {
    let size: CGFloat
    @Binding var alarmModel: AlarmModel

    var lineWidth: CGFloat = 10.0

    var body: some View {
        Circle()
            .stroke(lightGray, lineWidth: lineWidth)
            .frame(width: size, height: size)
            .overlay(
                VStack {
                    VStack {
                        GrayedTextView(text: "start", font: .caption)
                        TimePicker(time: $alarmModel.start.animation())
                    }
                    Spacer()
                    GrayedTextView(text: "Set the alarm")
                    Spacer()
                    VStack {
                        TimePicker(time: $alarmModel.end.animation())
                        GrayedTextView(text: "end", font: .caption)
                    }
                }
                .padding()
                .padding(.vertical)
            )
    }
}

struct CentralDatePickerVIew_Previews: PreviewProvider {
    static var previews: some View {
        CentralDatePickerView(size: 200, alarmModel: .constant(.DefaultAlarm()))
    }
}
