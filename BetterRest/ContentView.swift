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
    /*
    var components = DateComponents()
    components.hour = 8
    components.minute = 0
    let date = Calendar.current.date(from: components) ?? Date.now
    
    let components2 = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
    let hour = components2.hour ?? 0
    let minutes = components2.minute ?? 0
    */
    var body: some View {
        VStack {
            Stepper("\(sleepAmount.formatted()) hrs", value: $sleepAmount, in: 4...12, step: 0.25)
            DatePicker("enter a date", selection: $wakeUp, in: Date.now..., displayedComponents: .hourAndMinute)
                .labelsHidden()
            Text(Date.now, format: .dateTime.hour().minute())
            Text(Date.now, format: .dateTime.day().month().year())
            Text(Date.now.formatted(date: .long, time: .shortened))
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
