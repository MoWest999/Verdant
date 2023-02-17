//
//  TrackerView.swift
//  Verdant
//
//  Created by Dorothy Luetz on 2/14/23.
//

import SwiftUI

struct TrackerView: View {
    
    @State var presentPopupData = false
    @State var presentPopupInfo = false
    @State var presentPopupSettings = false
    @State var presentPopupAllData = false
    @State var gaugeValue = 75.0
    @State private var showingAlert = false
    @State private var compostString = ""
    var compostToDouble: Double {
        return Double(compostString) ?? 0
    }
    @State private var minValue = 0.0
    @State private var maxValueString = ""
    var maxValueDouble: Double {
        return Double(maxValueString) ?? 0
    }
    @State var compostDataCollection: [String] = []
    let formattedDate = Date().formatted(
        .dateTime
            .day().month(.wide).year()
    )
    let formattedTime = Date().formatted(
        .dateTime
            .hour().minute()
    )
    
    var body: some View {
        let compostAmount = compostToDouble
        NavigationStack {
            ZStack {
                VStack {
                    //title
                    Text("You've composted \(compostAmount) pounds this week!")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    Spacer()
                        .frame(maxHeight: 15)
                    Text("Goal: \(maxValueDouble) lbs")
                    Spacer()
                        .frame(maxHeight: 50)
                    

                        //tracker gauge
                        TrackerGauge(data: $compostString, gaugeValue: $gaugeValue, min: $minValue, max: $maxValueString)
                        Spacer()
                            .frame(maxHeight: 50)

                            //set goal
                    VStack {
                        Button {
                            showingAlert = true
                        } label: {
                            Text("Change Goal")
                        }
                        .alert("Change your composting goal", isPresented: $showingAlert) {
                            TextField("Enter amount", text: $maxValueString)
                            Button("Done") {
                                showingAlert = false
                            }
                        }
                        
                        Divider()
                            .frame(width: 150)
                        
                        Button {
                            presentPopupData = true
                        } label: {
                            Text("Add Data")
                                .foregroundColor(.accentColor)
                        }
                        .popover(isPresented: $presentPopupData, arrowEdge: .top) {
                            NavigationStack {
                                List {
                                    HStack {
                                        Text("Date")
                                            .opacity(0.5)
                                        Spacer()
                                        Text(formattedDate)
                                    }
                                    HStack {
                                        Text("Time")
                                            .opacity(0.5)
                                        Spacer()
                                        Text(formattedTime)
                                    }
                                    HStack {
                                        Text("Amount")
                                            .opacity(0.5)
                                        TextField("Enter amount", text: $compostString)
                                            .keyboardType(.decimalPad)
                                            .multilineTextAlignment(.trailing)
                                    } .onSubmit {
                                        compostDataCollection.append(compostString)
                                    }
                                }
                                Spacer()
                                    .toolbar {
                                        ToolbarItem(placement: .navigationBarLeading) {
                                            Button {
                                                presentPopupData = false
                                            } label: {
                                                Text("Cancel")
                                            }
                                        }
                                        ToolbarItem(placement: .navigationBarTrailing) {
                                            Button {
                                                presentPopupData = false
                                            } label: {
                                                Text("Done")
                                            }
                                        }
                                    }
                            }
                        }
                        Divider()
                            .frame(width: 150)
                        Button {
                            presentPopupAllData = true
                        } label: {
                            Text("View All Data")
                                .foregroundColor(.accentColor)
                        }
                        .popover(isPresented: $presentPopupAllData, arrowEdge: .top) {
                                NavigationStack {
                                    List {
                                        ForEach (compostDataCollection, id: \.self) {compost in
                                            Text(compost)
                                        }
                                        .onDelete { offsets in
                                            compostDataCollection.remove(atOffsets: offsets)
                                        }
                                }
                                Spacer()
                                    .toolbar {
                                        ToolbarItem(placement: .navigationBarLeading) {
                                            Button {
                                                presentPopupAllData = false
                                            } label: {
                                                Image(systemName: "chevron.down")
                                            }
                                        }
                                        ToolbarItem(placement: .navigationBarTrailing) {
                                            EditButton()
                                        }
                                    }

                            }
                        }
                    }
                }
                .toolbar {
                    //info button
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            presentPopupInfo = true
                        } label: {
                            Image(systemName: "questionmark")
                        }
                        .popover(isPresented: $presentPopupInfo, arrowEdge: .top) {
                            NavigationStack {
                                Text("Nothing to see here.")
                                    .frame(width: 100, height: 100)
                                .toolbar {
                                    ToolbarItem(placement: .navigationBarLeading) {
                                        Button {
                                            presentPopupInfo = false
                                        } label: {
                                            Image(systemName: "chevron.down")
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    
                    //settings button
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            presentPopupSettings = true
                        } label: {
                            Image(systemName: "gear")
                        }
                        .popover(isPresented: $presentPopupSettings, arrowEdge: .top) {
                            NavigationStack {
                                Text("Nothing to see here.")
                                    .frame(width: 100, height: 100)
                                    .toolbar {
                                        ToolbarItem(placement: .navigationBarLeading) {
                                            Button {
                                                presentPopupSettings = false
                                            } label: {
                                                Image(systemName: "chevron.down")
                                            }
                                        }
                                    }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct TrackerView_Previews: PreviewProvider {
    static var previews: some View {
        TrackerView()
    }
}
