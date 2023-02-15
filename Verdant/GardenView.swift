//
//  GardenView.swift
//  Verdant
//
//  Created by Dorothy Luetz on 2/7/23.
//

import SwiftUI

struct GardenView: View {
    
    @State var presentPopup = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Text("filler")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("My Garden")
                                .font(.title)
                        }
                    }
                    .toolbar {
                        //info button
                        ToolbarItem(placement: .navigationBarLeading) {
                            Button {
                                presentPopup = true
                            } label: {
                                Image(systemName: "questionmark")
                            }
                            .popover(isPresented: $presentPopup, arrowEdge: .top) {
                                Text("test")
                                    .frame(width: 100, height: 100)
                            }
                        }
                        //settings button
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                presentPopup = true
                            } label: {
                                Image(systemName: "gear")
                            }
                            .popover(isPresented: $presentPopup, arrowEdge: .top) {
                                Text("test")
                                    .frame(width: 100, height: 100)
                            }
                        }
                    }
            }
        }
    }
}

struct GardenView_Previews: PreviewProvider {
    static var previews: some View {
        GardenView()
    }
}
