
//
//  TrackerGauges.swift
//  Verdant
//
//  Created by Dorothy Luetz on 2/14/23.
//

import SwiftUI

//tracker gauge style
struct TrackerGaugeStyle: GaugeStyle {
    
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
            Image("verdantlogo")
                .resizable()
                .frame(width: 60, height: 60)
            }
        }
    }

//tracker gauge template
struct TrackerGauge: View {
    
    @Binding var data: String
    @Binding var gaugeValue: Double
    @Binding var min: Double
    @Binding var max: String
    
    var body: some View {
        Gauge(value: (Double(data) ?? 0), in: min ... (Double(max) ?? 0)) {
            Text("")
        } currentValueLabel: {
            Text("")
                .foregroundColor(gaugeValue == 100 ? Color.accentColor : Color.accentColor)
        } minimumValueLabel: {
            Text("")
        } maximumValueLabel: {
            Text("")
        }.gaugeStyle(TrackerGaugeStyle())
            .tint(gaugeValue == 100 ? Color.accentColor : Color.accentColor)
    }
}

//color for gauge button
struct CustomColor {
static let dataText = Color("datatext")
}
