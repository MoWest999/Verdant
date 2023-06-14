//
//  ContentView.swift
//  Verdant
//
//  Created by Monique West on 2/3/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            TrackerView()
                .tabItem() {
                    Label("Tracker", systemImage: "book")
                }
            CommunityView()
                .tabItem() {
                    Label("Community", systemImage: "map")
                }
            GardenView()
                .tabItem() {
                    Label("My Garden", systemImage: "tree")
                }
        } .accentColor(.accentColor)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
