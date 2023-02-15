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
    @State private var compostInput = ""
    var compostAmount: Double {
        return Double(compostInput) ?? 0
    }
    @State private var minValue = 0.0
    @State private var maxValueString = ""
    var maxValueDouble: Double {
        return Double(maxValueString) ?? 0
    }
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View {
        NavigationStack {
            ZStack {
                ScrollView {
                VStack {
                    //title
                    Text("You've composted \(compostAmount) pounds this week!")
                        .font(.title)
                        .multilineTextAlignment(.center)

                }
                VStack {
                    //tracker gauge
                    TrackerGauge(data: compostAmount, gaugeValue: gaugeValue, min: minValue, max: maxValueDouble)
                    Spacer()
                        .frame(maxHeight: 300)
                }
                    Spacer()
                VStack {
                    //set goal
                    Text("Goal: \(maxValueDouble) lbs")
                    Button {
                        showingAlert = true
                    } label: {
                        Text("Change goal")
                    }
                    .alert("Change your composting goal", isPresented: $showingAlert, actions: {
                        TextField("Enter amount", text: $maxValueString)
                        Button("Done", action: {})
                    })
                }
                VStack {
                    //add compost
                    Button {
                        showingAlertTwo = true
                    } label: {
                        Image(systemName: "plus")
                    }
                    .alert("Enter compost amount", isPresented: $showingAlertTwo, actions: {
                        TextField("Enter amount", text: $compostInput)
                        Button("Done", action: {})
                    }) .buttonStyle(.borderedProminent)
                        .controlSize(.small)
                }
                VStack {
                    Text("History")
                        .font(.title2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding()
                    Divider()
                        .frame(width: 360)
                    Text("date")
                        .frame(width: 330, alignment: .leading)
                        .fontWeight(.light)
                    HStack {
                        MyDataGauge(data: compostAmount, gaugeValue: gaugeValue, min: minValue, max: maxValueDouble)
                        Spacer()
                            .frame(maxWidth: 10)
                        Text("This week, you composted example out of a goal of example lbs.")
                            .frame(maxWidth: 240, alignment: .trailing)
                    }
                    Divider()
                        .frame(width: 360)
                    Text("date")
                        .frame(width: 330, alignment: .leading)
                        .fontWeight(.light)
                    HStack {
                        MyDataGauge(data: compostAmount, gaugeValue: gaugeValue, min: minValue, max: maxValueDouble)
                        Spacer()
                            .frame(maxWidth: 10)
                        Text("This week, you composted example out of a goal of example lbs.")
                            .frame(maxWidth: 240, alignment: .trailing)
                    }
                    Divider()
                        .frame(width: 360)
                    Text("date")
                        .frame(width: 330, alignment: .leading)
                        .fontWeight(.light)
                    HStack {
                        MyDataGauge(data: compostAmount, gaugeValue: gaugeValue, min: minValue, max: maxValueDouble)
                        Spacer()
                            .frame(maxWidth: 10)
                        Text("This week, you composted example out of a goal of example lbs.")
                            .frame(maxWidth: 240, alignment: .trailing)
                    }
                }
            }
        }
                        .toolbar {
                            //info button
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
                            //settings button
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

//tracker gauge style
struct TrackerGaugeStyle: GaugeStyle {
    
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

//tracker gauge template
struct TrackerGauge: View {
    
    @State var data: Double
    @State var gaugeValue: Double
    @State var min: Double
    @State var max: Double
    
    var body: some View {
        Gauge(value: data, in: min ... max) {
            Text("Gauge Title")
        } currentValueLabel: {
            Text("50% Complete")
                .foregroundColor(gaugeValue == 100 ? CustomColor.primaryColor : CustomColor.primaryColor)
        } minimumValueLabel: {
            Text("0")
        } maximumValueLabel: {
            Text("100")
        }.gaugeStyle(TrackerGaugeStyle())
            .tint(gaugeValue == 100 ? CustomColor.primaryColor : CustomColor.primaryColor)
    }
}

//my data gauge style
struct DataGaugeStyle: GaugeStyle {
    
    func makeBody(configuration: GaugeStyleConfiguration) -> some View {
        ZStack {
            Circle()
                .stroke(CustomColor.primaryColor.opacity(0.25), lineWidth: 7)
                .frame(width: 50, height: 50)
            Circle()
                .trim(from: 0, to: CGFloat(configuration.value))
                .stroke(configuration.value * 100 == 100 ?  CustomColor.primaryColor : Color.accentColor,
                        style: StrokeStyle(lineWidth: 7, lineCap: .round))
                .frame(width: 50, height: 50)
                .rotationEffect(Angle(degrees: -90))
            }
        }
    }

//data gauge template
struct MyDataGauge: View {
    
    @State var data: Double
    @State var gaugeValue: Double
    @State var min: Double
    @State var max: Double
    
    var body: some View {
        Gauge(value: data, in: min ... max) {
            Text("Gauge Title")
        } currentValueLabel: {
            Text("50% Complete")
                .foregroundColor(gaugeValue == 100 ? CustomColor.primaryColor : CustomColor.primaryColor)
        } minimumValueLabel: {
            Text("0")
        } maximumValueLabel: {
            Text("100")
        }.gaugeStyle(DataGaugeStyle())
            .tint(gaugeValue == 100 ? CustomColor.primaryColor : CustomColor.primaryColor)
    }
}

struct DataTab: View {
    
    @State var data: Double
    @State var gaugeValue: Double
    @State var min: Double
    @State var max: Double
    
    var body: some View {
        Divider()
            .frame(width: 360)
        Text("date")
            .frame(width: 330, alignment: .leading)
            .fontWeight(.light)
        HStack {
            Spacer()
                .frame(maxWidth: 10)
            Text("This week, you composted example out of a goal of example lbs.")
                .frame(maxWidth: 240, alignment: .trailing)
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
