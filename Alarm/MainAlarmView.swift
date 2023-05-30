//
//  ContentView.swift
//  Alarm
//
//  Created by Łukasz Modzelewski on 30/05/2023.
//

import SwiftUI

struct MainAlarmView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct MainAlarmView_Previews: PreviewProvider {
    static var previews: some View {
        MainAlarmView()
    }
}
