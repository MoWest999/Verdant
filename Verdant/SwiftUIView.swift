//
//  SwiftUIView.swift
//  Verdant
//
//  Created by Mason Christeerfield on 6/8/23.
//

import SwiftUI

struct TrackerView: View {
    @StateObject private var viewModel = TrackerViewModel()
    @State private var showingAlert = false
    @State private var presentPopupData = false
    @State private var presentPopupAllData = false
    @State private var presentPopupInfo = false
    @State private var presentPopupSettings = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    Text("You've composted \(viewModel.trackerData.compostAmount) pounds this week!")
                        .font(.title)
                        .multilineTextAlignment(.center)
                    
                    Spacer().frame(maxHeight: 15)
                    
                    Text("Goal: \(viewModel.trackerData.maxValue) lbs")
                    
                    Spacer().frame(maxHeight: 50)
                    
                    TrackerGauge(data: $viewModel.compostString, gaugeValue: $viewModel.trackerData.compostAmount, min: $viewModel.trackerData.minValue, max: $viewModel.maxValueString)
                    
                    Spacer().frame(maxHeight: 50)
                    
                    VStack {
                        Button {
                            showingAlert = true
                        } label: {
                            Text("Change Goal")
                        }
                        .alert("Change your composting goal", isPresented: $showingAlert) {
                            TextField("Enter amount", text: $viewModel.maxValueString)
                            Button("Done") {
                                showingAlert = false
                                viewModel.updateMaxValue()
                            }
                        }
                        
                        Divider().frame(width: 150)
                        
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
                                        Text(Date().formatted(.dateTime.day().month(.wide).year()))
                                    }
                                    HStack {
                                        Text("Time")
                                            .opacity(0.5)
                                        Spacer()
                                        Text(Date().formatted(.dateTime.hour().minute()))
                                    }
                                    HStack {
                                        Text("Amount")
                                            .opacity(0.5)
                                        TextField("Enter amount", text: $viewModel.compostString)
                                            .keyboardType(.decimalPad)
                                            .multilineTextAlignment(.trailing)
                                    }
                                    .onSubmit {
                                        viewModel.addCompostData()
                                        presentPopupData = false
                                    }
                                }
                                
                                Spacer().toolbar {
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
                                            viewModel.addCompostData()
                                        } label: {
                                            Text("Done")
                                        }
                                    }
                                }
                            }
                        }
                        
                        Divider().frame(width: 150)
                        
                        Button {
                            presentPopupAllData = true
                        } label: {
                            Text("View All Data")
                                .foregroundColor(.accentColor)
                        }
                        .popover(isPresented: $presentPopupAllData, arrowEdge: .top) {
                            NavigationStack {
                                List {
                                    ForEach(viewModel.trackerData.compostDataCollection, id: \.self) { compostData in
                                        Text(compostData.amount)
                                    }
                                    .onDelete { offsets in
                                        viewModel.deleteCompostData(atOffsets: offsets)
                                    }
                                }
                                Spacer().toolbar {
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
