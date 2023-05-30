//
//  GrayedTextView.swift
//  Alarm
//
//  Created by Łukasz Modzelewski on 30/05/2023.
//

import SwiftUI

struct GrayedTextView: View {
    let text: LocalizedStringKey
    var font = Font.headline

    var body: some View {
        Text(text)
            .foregroundColor(.gray)
            .font(font)
    }
}

struct GrayedTextView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollView {
            VStack {
                GrayedTextView(text: "The UI for this nice Alarm app was largely inspired by the amazing work of Anton Leogky.", font: .title)

                GrayedTextView(text: "The UI for this nice Alarm app was largely inspired by the amazing work of Anton Leogky.", font: .subheadline)
            }.padding()
        }
    }
}
