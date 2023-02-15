//
//  CommunityView.swift
//  Verdant
//
//  Created by Dorothy Luetz on 2/7/23.
//

import SwiftUI

struct CommunityView: View {
    
    @State var presentPopup = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Text("filler")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Community")
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

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
