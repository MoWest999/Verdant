//
//  FaqView.swift
//  Verdant
//
//  Created by Mason Christeerfield on 6/13/23.
//

import SwiftUI

struct FaqView: View {
    @ObservedObject var viewModel: TrackerViewModel
    
    var body: some View {
        NavigationStack {
            Text("what is composting?")
                .frame(width: 100, height: 100)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        viewModel.isShowingFaqView = false
                    } label: {
                        Image(systemName: "chevron.down")
                    }
                }
            }
        }
    }
}

struct FaqView_Previews: PreviewProvider {
    static var previews: some View {
        FaqView(viewModel: TrackerViewModel())
    }
}
