//
//  DataGauges.swift
//  Verdant
//
//  Created by Dorothy Luetz on 2/14/23.
//

import SwiftUI

//my data gauge style
struct DataGaugeStyle: GaugeStyle {
    
    func makeBody(configuration: GaugeStyleConfiguration) -> some View {
        ZStack {
            Circle()
                .stroke(Color.accentColor.opacity(0.25), lineWidth: 7)
                .frame(width: 50, height: 50)
            Circle()
                .trim(from: 0, to: CGFloat(configuration.value))
                .stroke(configuration.value * 100 == 100 ?  Color.accentColor : Color.accentColor,
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
                .foregroundColor(gaugeValue == 100 ? Color.accentColor : Color.accentColor)
        } minimumValueLabel: {
            Text("0")
        } maximumValueLabel: {
            Text("100")
        }.gaugeStyle(DataGaugeStyle())
            .tint(gaugeValue == 100 ? Color.accentColor : Color.accentColor)
    }
}

//gauge and text for history
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
