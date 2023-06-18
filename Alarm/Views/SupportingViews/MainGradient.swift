//
//  MainGradient.swift
//  Alarm
//
//  Created by Łukasz Modzelewski on 30/05/2023.
//

import SwiftUI

struct MainGradient: View {
    var startRadius: CGFloat = 0.0
    let endRadius: CGFloat
    var scaleX: CGFloat = 2.0
    var opacityLinGrad = 0.5
    var opacityRadGrad = 1.0
    var yellowColor = yellow

    var body: some View {
        ZStack {
            LinearGradient(colors: [blue, purple, pink], startPoint: .top, endPoint: .bottom)
                .opacity(opacityLinGrad)
            RadialGradient(colors: [yellowColor, .clear], center: .bottom, startRadius: startRadius, endRadius: endRadius)
                .opacity(opacityRadGrad)
                .scaleEffect(x: scaleX)

//            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct MainGradient_Previews: PreviewProvider {
    static var previews: some View {
        MainGradient(endRadius: 75)
            .frame(width: screenWidth, height: 150)
    }
}
