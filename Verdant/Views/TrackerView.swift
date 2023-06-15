//
//  TrackerView.swift
//  Verdant
//
//  Created by Dorothy Luetz on 2/14/23.
//

import SwiftUI

struct TrackerView: View {
    
    @StateObject var viewModel = TrackerViewModel()
    
   
    @State var gaugeValue = 75.0 // what is this doing?
    
    
    @State private var compostString = ""
    var compostToDouble: Double.IntegerLiteralType {
        return Double.IntegerLiteralType(compostString) ?? 0
    }
    @State private var minValue = 0.0
    @State private var maxValueString = ""
    var maxValueDouble: Double.IntegerLiteralType {
        return Double.IntegerLiteralType(maxValueString) ?? 0
    }
   
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
                            viewModel.isShowingChangeCompostAlert = true
                           // trackerViewModel.data = compostString
                            //trackerViewModel.sendData(data:data)
                        } label: {
                            Text("Change Goal")
                        }
                        .alert("Change your composting goal", isPresented: $viewModel.isShowingChangeCompostAlert) {
                            TextField("Enter amount", text: $maxValueString)
                            Button("Done") {
                                viewModel.isShowingChangeCompostAlert = false
                            }
                        }
                        
                        Divider()
                            .frame(width: 150)
                        
                        Button {
                            viewModel.isShowingAddCompostView = true
                        } label: {
                            Text("Add Compost Amount")
                                .foregroundColor(.accentColor)
                        }
                        .popover(isPresented: $viewModel.isShowingAddCompostView, arrowEdge: .top) {
                            AddWeeklyCompostView(viewModel: viewModel)
                        }
                        Divider()
                            .frame(width: 150)
                        Button {
                            viewModel.isShowingCommpostEntriesListView = true
                        } label: {
                            Text("Compost History")
                                .foregroundColor(.accentColor)
                        }
                        .popover(isPresented: $viewModel.isShowingCommpostEntriesListView, arrowEdge: .top) {
                            CompostEntriesListView(viewModel: viewModel)
                                
                        }
                    }
                }
                .toolbar {
                    //faq page appears when use taps button
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            viewModel.isShowingFaqView = true
                        } label: {
                            Image(systemName: "questionmark")
                        }
                        .popover(isPresented: $viewModel.isShowingFaqView, arrowEdge: .top) {
                           FaqView(viewModel: viewModel)
                        }
                    }
                    
                    
                    //settings button
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            viewModel.isShowingSettingsView = true
                        } label: {
                            Image(systemName: "gear")
                        }
                        .popover(isPresented: $viewModel.isShowingSettingsView, arrowEdge: .top) {
                            SettingsView(viewModel: viewModel)
                            
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
