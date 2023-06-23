//
//  TimeArcView.swift
//  Alarm
//
//  Created by Łukasz Modzelewski on 18/06/2023.
//

import SwiftUI

struct TimeArcView: View {
    let percentDifference: CGFloat
    let strokeStyle: StrokeStyle
    let size: CGFloat
    let rotateCircleOffset: CGFloat
    let color: Color

    var body: some View {
        Circle()
            .trim(from: 0, to: percentDifference)
            .stroke(style: strokeStyle)
            .foregroundColor(color)
            .frame(width: size, height: size)
            .rotationEffect(.degrees(-90))
            .rotationEffect(.degrees(rotateCircleOffset))
    }
}

struct TimeArcView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            TimeArcView(percentDifference: 0.5, strokeStyle: StrokeStyle(lineWidth: 15, dash: [1, 2]), size: 200, rotateCircleOffset: 30, color: lightGray)
        }
    }
}
