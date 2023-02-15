//
//  TrackerGauges.swift
//  Verdant
//
//  Created by Dorothy Luetz on 2/14/23.
//

import SwiftUI

//tracker gauge style
struct TrackerGaugeStyle: GaugeStyle {
    
    @State var presentPopup = false
    
    func makeBody(configuration: GaugeStyleConfiguration) -> some View {
        ZStack {
            Circle()
                .stroke(Color.accentColor.opacity(0.25), lineWidth: 17)
                .frame(width: 175, height: 175)
            Circle()
                .trim(from: 0, to: CGFloat(configuration.value))
                .stroke(configuration.value * 100 == 100 ?  Color.accentColor : Color.accentColor,
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
                .foregroundColor(gaugeValue == 100 ? Color.accentColor : Color.accentColor)
        } minimumValueLabel: {
            Text("0")
        } maximumValueLabel: {
            Text("100")
        }.gaugeStyle(TrackerGaugeStyle())
            .tint(gaugeValue == 100 ? Color.accentColor : Color.accentColor)
    }
}

//color for gauge button
struct CustomColor {
static let dataText = Color("datatext")
}
