//
//  AddWeeklyCompostView.swift
//  Verdant
//
//  Created by Mason Christeerfield on 6/12/23.
//

import SwiftUI

struct AddWeeklyCompostView: View {
    @ObservedObject var viewModel: TrackerViewModel
    @State var newEntry = CompostEntry()
    
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Text("Date")
                        .opacity(0.5)
                    Spacer()
                    Text(newEntry.formattedDate)
                }
                HStack {
                    Text("Time")
                        .opacity(0.5)
                    Spacer()
                    Text(newEntry.formattedTime)
                }
                HStack {
                    Text("Amount")
                        .opacity(0.5)
                    TextField("Enter amount", text: $newEntry.amount)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                } .onSubmit {
                    viewModel.compostEntries.append(newEntry)
                }
            }
            Spacer()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            viewModel.isShowingAddCompostView = false
                        } label: {
                            Text("Cancel")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button {
                            viewModel.isShowingAddCompostView = false
                            viewModel.compostEntries.append(newEntry)
                        } label: {
                            Text("Done")
                        }
                    }
                }
        }
    }
}

struct AddWeeklyCompostView_Previews: PreviewProvider {
    static var previews: some View {
        AddWeeklyCompostView(viewModel: TrackerViewModel())
    }
}
