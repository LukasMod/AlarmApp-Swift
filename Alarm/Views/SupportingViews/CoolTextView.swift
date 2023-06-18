//
//  CoolTextView.swift
//  Alarm
//
//  Created by Łukasz Modzelewski on 30/05/2023.
//

import SwiftUI

struct CoolTextView: View {
    let fontName = "WorkSans-Italic-VariableFont_wght"
    let text: LocalizedStringKey
    let size: CGFloat

    var body: some View {
        Text(text)
            .font(Font.custom(fontName, size: size))
            .shadow(color: .black.opacity(0.3), radius: 3, x: 0, y: 0)
    }
}

struct CoolTextView_Previews: PreviewProvider {
    static var previews: some View {
        CoolTextView(text: "set alarm and\nwake up easily", size: 36)
    }
}
