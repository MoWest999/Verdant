//
//  CommunityView.swift
//  Verdant
//
//  Created by Dorothy Luetz on 2/7/23.
//

import MapKit
import SwiftUI

struct CommunityView: View {
    
    @State var presentPopup = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Compost Sites")
                    .navigationBarTitleDisplayMode(.inline)
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Text("Community")
                                .font(.title)
                        }
                    }
                MapView()
                //Text ("add community text here....")
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentPopup = true
                    } label: {
                        Image(systemName: "questionmark")
                            .foregroundColor(CustomColor.primaryColor)
                    }
                    .popover(isPresented: $presentPopup, arrowEdge: .top) {
                        Text("test")
                            .frame(width: 100, height: 100)
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        presentPopup = true
                    } label: {
                        Image(systemName: "gear")
                            .foregroundColor(CustomColor.primaryColor)
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

struct CommunityView_Previews: PreviewProvider {
    static var previews: some View {
        CommunityView()
    }
}
