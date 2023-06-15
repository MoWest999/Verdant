//
//  AddWeeklyCompostView.swift
//  Verdant
//
//  Created by Mason Christeerfield on 6/12/23.
//

import SwiftUI

struct AddWeeklyCompostView: View {
    @ObservedObject var viewModel: TrackerViewModel
    @State var amount: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                HStack {
                    Text("Date")
                        .opacity(0.5)
                    Spacer()
                    Text(Date().formatted(date: .abbreviated, time: .omitted))
                }
                HStack {
                    Text("Time")
                        .opacity(0.5)
                    Spacer()
                        Text(Date().formatted(date: .omitted, time: .shortened))
                }
                HStack {
                    Text("Amount")
                        .opacity(0.5)
                    TextField("Enter amount", text: $amount)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                        .onSubmit {
                           viewModel.addCompostEntry(amount: Double(amount)!)
                           viewModel.saveCompostEntries()
                       }
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
