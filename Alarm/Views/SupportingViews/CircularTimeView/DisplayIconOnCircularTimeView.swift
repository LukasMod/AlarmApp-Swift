//
//  DisplayIconOnCircularTimeView.swift
//  Alarm
//
//  Created by Łukasz Modzelewski on 18/06/2023.
//

import SwiftUI

struct DisplayIconOnCircularTimeView: View {
    let time: Date
    let size: CGFloat
    let percent: CGFloat

    var circleFrame = 40.0

    var body: some View {
        Circle()
            .fill(cardBackgroundColor)
            .frame(width: circleFrame, height: circleFrame)
            .shadow(color: black.opacity(0.5), radius: 1, x: 0, y: 1)
            .overlay(
                TimeOfDayIcon(date: time)
            )
            .rotation3DEffect(.degrees(-percent * 360), axis: (x: 0, y: 0, z: 1))
            .offset(y: -size / 2)
            .rotation3DEffect(.degrees(percent * 360), axis: (x: 0, y: 0, z: 1))
    }
}

struct DisplayIconOnCircularTimeView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            black.ignoresSafeArea()

            DisplayIconOnCircularTimeView(time: Date(), size: 200, percent: 0.5)
        }
    }
}
