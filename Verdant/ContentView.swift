//
//  ContentView.swift
//  Verdant
//
//  Created by Monique West on 2/3/23.
//

import SwiftUI

struct TrackerView: View {
    
    @State var presentPopup = false
    @State var gaugeValue = 75.0
    @State private var showingAlert = false
    @State private var showingAlertTwo = false
    @State private var compostAmount = 0.0
    @State private var minValue = 0.0
    @State private var maxValue = 0.0
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    //title
                    Text("You've composted \(compostAmount) pounds this week!")
                    Text("cory is the best mentor")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                VStack {
                    //tracker gauge
                    Gauge(value: compostAmount, in: minValue ... maxValue) {
                        Text("Gauge Title")
                    } currentValueLabel: {
                        Text("50% Complete")
                            .foregroundColor(gaugeValue == 100 ? CustomColor.primaryColor : CustomColor.primaryColor)
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("100")
                    }.gaugeStyle(CustomCircularGaugeStyle())
                        .tint(gaugeValue == 100 ? CustomColor.primaryColor : CustomColor.primaryColor)
                    Spacer()
                        .frame(maxHeight: 300)
                }
                VStack {
                    Text("Goal: \(maxValue) lbs")
                    Button {
                        showingAlert = true
                    } label: {
                        Text("Change goal")
                    }
                    .alert("Change your composting goal", isPresented: $showingAlert, actions: {
                        TextField("Enter amount", value: $maxValue, formatter: formatter)
                        Button("Done", action: {})
                    })
                }
                VStack {
                    Spacer()
                        .frame(minHeight: 50, maxHeight: 90)
                    Button {
                        showingAlertTwo = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .alert("Enter compost amount", isPresented: $showingAlertTwo, actions: {
                        TextField("Enter amount", value: $compostAmount, formatter: formatter)
                        Button("Done", action: {})
                    }) .buttonStyle(.borderedProminent)
                        .controlSize(.small)
                }
                }
                    //info button
                        .toolbar {
                            ToolbarItem(placement: .navigationBarLeading) {
                                Button {
                                    presentPopup = true
                                } label: {
                                    Image(systemName: "questionmark")
                                }
                                .popover(isPresented: $presentPopup, arrowEdge: .top) {
                                    Text("test")
                                        .frame(width: 100, height: 100)
                                }
                            }
                        }
                //settings button
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                presentPopup = true
                            } label: {
                                Image(systemName: "gear")
                            }
                            .popover(isPresented: $presentPopup, arrowEdge: .top) {
                                Text("test")
                                    .frame(width: 100, height: 100)
                            }
                        }
                    }
            }
        }
    }


struct CustomCircularGaugeStyle: GaugeStyle {
    
    @State var presentPopup = false
    
    func makeBody(configuration: GaugeStyleConfiguration) -> some View {
        ZStack {
            Circle()
                .stroke(CustomColor.primaryColor.opacity(0.25), lineWidth: 17)
                .frame(width: 175, height: 175)
            Circle()
                .trim(from: 0, to: CGFloat(configuration.value))
                .stroke(configuration.value * 100 == 100 ?  CustomColor.primaryColor : Color.accentColor,
                        style: StrokeStyle(lineWidth: 17, lineCap: .round))
                .frame(width: 175, height: 175)
                .rotationEffect(Angle(degrees: -90))
            Button {
                presentPopup = true
            } label: {
                Text("Click here to see your data")
                    .frame(width: 110)
                    .foregroundColor(CustomColor.dataText)
            }
            .popover(isPresented: $presentPopup, arrowEdge: .top) {
                NavigationStack {
                    Text("test")
                }
            }
        }
    }
}

struct ContentView: View {
    var body: some View {
        TabView {
            TrackerView()
                .tabItem() {
                    Label("Tracker", systemImage: "book")
                }
            CommunityView()
                .tabItem() {
                    Label("Community", systemImage: "map")
                }
            GardenView()
                .tabItem() {
                    Label("My Garden", systemImage: "tree")
                }
        } .accentColor(CustomColor.primaryColor)
    }
}

struct CustomColor {
    static let primaryColor = Color("primarycolor")
    static let dataText = Color("datatext")
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
