//
//  CompostEntriesListView.swift
//  Verdant
//
//  Created by Mason Christeerfield on 6/12/23.
//

import SwiftUI

struct CompostEntriesListView: View {
    @ObservedObject var viewModel: TrackerViewModel
    
    var body: some View {
        NavigationStack {
            List {
                ForEach (viewModel.compostEntries) {compost in
                    Text(compost.amount)
                }
                .onDelete { offsets in
                    viewModel.compostEntries.remove(atOffsets: offsets)
                }
            }
            Spacer()
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            viewModel.isShowingCommpostEntriesListView = false
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

struct CompostEntriesListView_Previews: PreviewProvider {
    static var previews: some View {
        CompostEntriesListView(viewModel: TrackerViewModel())
    }
}
