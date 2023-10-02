//
//  ContentView.swift
//  BetterRest
//
//  Created by aydin salman on 02/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack {
            Stepper("\(sleepAmount.formatted()) hrs", value: $sleepAmount, in: 4...12, step: 0.25)
            DatePicker("enter a date", selection: $wakeUp, in: Date.now..., displayedComponents: .hourAndMinute)
                .labelsHidden()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
