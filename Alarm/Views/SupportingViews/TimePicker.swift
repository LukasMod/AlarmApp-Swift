//
//  TimePicker.swift
//  Alarm
//
//  Created by Łukasz Modzelewski on 18/06/2023.
//

import SwiftUI

struct TimePicker: View {
    @Binding var time: Date
    var scale: CGFloat = 1.0

    var body: some View {
        DatePicker("", selection: $time, displayedComponents: .hourAndMinute)
            .scaleEffect(scale)
            .labelsHidden()
    }
}

struct TimePicker_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 15) {
            TimePicker(time: .constant(Date()), scale: 0.85)
            TimePicker(time: .constant(Date()), scale: 1)
            TimePicker(time: .constant(Date()), scale: 1.15)
            TimePicker(time: .constant(Date()), scale: 1.3)
        }
    }
}
