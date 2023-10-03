//
//  ContentView.swift
//  BetterRest
//
//  Created by aydin salman on 02/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUpTime = Date.now
    @State private var coffeeAmount = 1
    /*
    var components = DateComponents()
    components.hour = 8
    components.minute = 0
    let date = Calendar.current.date(from: components) ?? Date.now
    
    let components2 = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
    let hour = components2.hour ?? 0
    let minutes = components2.minute ?? 0
    */
    
    func calculateBedtime(){
        
    }
    
    var body: some View {
        NavigationView{
            VStack {
                Text("when do u want to wake up?")
                    .font(.headline)
                DatePicker("please enter a time", selection: $wakeUpTime, in: Date.now..., displayedComponents: .hourAndMinute)
                    .labelsHidden()
                Text("desired amount of sleep")
                    .font(.headline)
                Stepper("\(sleepAmount.formatted()) hrs", value: $sleepAmount, in: 4...12, step: 0.25)
                Text("daily coffee intake")
                    .font(.headline)
                Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                /*
                 Text(Date.now, format: .dateTime.hour().minute())
                 Text(Date.now, format: .dateTime.day().month().year())
                 Text(Date.now.formatted(date: .long, time: .shortened))
                 */
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("calculate", action: calculateBedtime)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
