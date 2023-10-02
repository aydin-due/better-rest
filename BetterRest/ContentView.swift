//
//  ContentView.swift
//  BetterRest
//
//  Created by aydin salman on 02/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hrs", value: $sleepAmount, in: 4...12, step: 0.25)
            .padding()
    }
}

#Preview {
    ContentView()
}
