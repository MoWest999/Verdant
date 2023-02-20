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
    @FocusState private var dataIsFocused: Bool
    @ObservedObject var data = TrackerData()
    
    var body: some View {
        let compostAmount = data.compostToDouble
        NavigationStack {
            ZStack {
                VStack {
                    //title
                    Text("You've composted \(compostAmount) pounds this week!")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    Spacer()
                        .frame(maxHeight: 15)
                    Text("Goal: \(data.maxValueDouble) lbs")
                    Spacer()
                        .frame(maxHeight: 50)
                    

                        //tracker gauge
                    TrackerGauge(data: $data.compostString, gaugeValue: $data.gaugeValue, min: $data.minValue, max: $data.maxValueString)
                        Spacer()
                            .frame(maxHeight: 50)

                            //set goal
                    VStack {
                        Button {
                            data.showingAlert = true
                        } label: {
                            Text("Change Goal")
                        }
                        .alert("Change your composting goal", isPresented: $data.showingAlert) {
                            TextField("Enter amount", text: $data.maxValueString)
                                .keyboardType(.decimalPad)
                            Button("Done") {
                                data.showingAlert = false
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
                                        Text(data.formattedDate)
                                    }
                                    HStack {
                                        Text("Time")
                                            .opacity(0.5)
                                        Spacer()
                                        Text(data.formattedTime)
                                    }
                                    HStack {
                                        Text("Amount")
                                            .opacity(0.5)
                                        TextField("Enter amount", text: $data.compostString)
                                            .keyboardType(.decimalPad)
                                            .multilineTextAlignment(.trailing)
                                            .focused($dataIsFocused)
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
                                                dataIsFocused = false
                                                presentPopupData = false
                                                data.compostDataCollection.append(data.compostString)
                                            } label: {
                                                Text("Add")
                                            }
                                        }
                                    }
                            }
                        }
                        Divider()
                            .frame(width: 150)
                        Button {
                            presentPopupAllData.toggle()
                        } label: {
                            Text("View All Data")
                                .foregroundColor(.accentColor)
                        } .sheet(isPresented: $presentPopupAllData) {
                            AllDataView()
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
