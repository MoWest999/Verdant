//
//  SettingsView.swift
//  Verdant
//
//  Created by Mason Christeerfield on 6/13/23.
//

import SwiftUI

struct SettingsView: View {
    @ObservedObject var viewModel: TrackerViewModel
    var body: some View {
       NavigationStack {
            Text("Nothing to see here.")
                .frame(width: 100, height: 100)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            
                            viewModel.isShowingSettingsView = false
                        } label: {
                            Image(systemName: "chevron.down")
                        }
                    }
                }
        }
    }    
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(viewModel: TrackerViewModel())
    }
}
