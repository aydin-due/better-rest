//
//  ContentView.swift
//  BetterRest
//
//  Created by aydin salman on 02/10/23.
//

import SwiftUI
import CoreML

struct ContentView: View {
    @State private var sleepAmount = 8.0
    @State private var wakeUpTime = defaultWakeUpTime
    @State private var coffeeAmount = 1
    @State private var alertTitle = ""
    @State private var alertText = ""
    @State private var showingAlert = false
    
    // static allows us to read it bc it doesn't rely on any other property
    // belongs to the struct itself rather than an instance
    static var defaultWakeUpTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? Date.now
    }
    
    func calculateBedtime(){
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUpTime)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            let prediction = try model.prediction(wake: Int64(Double(hour+minute)), estimatedSleep: sleepAmount, coffee: Int64(Double(coffeeAmount)))
            let sleepTime = wakeUpTime - prediction.actualSleep
            alertTitle = "your ideal bedtime is..."
            alertText = sleepTime.formatted(date: .omitted, time: .shortened)
            
        } catch {
            alertTitle = "error"
            alertText = "something went wrong ://"
        }
        showingAlert = true
    }
    
    var body: some View {
        NavigationView{
            Form {
                VStack(alignment: .leading) {
                    Text("when do u want to wake up?")
                        .font(.headline)
                    DatePicker("please enter a time", selection: $wakeUpTime, in: Date.now..., displayedComponents: .hourAndMinute)
                        .labelsHidden()
                }
                VStack(alignment: .leading) {
                    Text("desired amount of sleep")
                        .font(.headline)
                    Stepper("\(sleepAmount.formatted()) hrs", value: $sleepAmount, in: 4...12, step: 0.25)
                }
                VStack(alignment: .leading) {
                    Text("daily coffee intake")
                        .font(.headline)
                    Stepper(coffeeAmount == 1 ? "1 cup" : "\(coffeeAmount) cups", value: $coffeeAmount, in: 1...20)
                }
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
            .alert(alertTitle, isPresented: $showingAlert){
                Button("ok"){}
            } message: {
                Text(alertText)
            }
        }
    }
}

#Preview {
    ContentView()
}
