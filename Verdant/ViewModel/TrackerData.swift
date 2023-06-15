//
//  TrackerData.swift
//  Verdant
//
//  Created by Dorothy Luetz on 2/20/23.
//

import Foundation
import SwiftUI

//tracker data values
class TrackerData: ObservableObject {
    var gaugeValue = 75.0
    @Published var showingAlert = false
    var compostString = ""
    var compostToDouble: Double {
        return Double(compostString) ?? 0
    }
    var minValue = 0.0
    var maxValueString = ""
    var maxValueDouble: Double {
        return Double(maxValueString) ?? 0
    }
    @Published var compostDataCollection: [String] = []
    let formattedDate = Date().formatted(
        .dateTime
            .day().month(.wide).year()
    )
    let formattedTime = Date().formatted(
        .dateTime
            .hour().minute()
    )
}

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

