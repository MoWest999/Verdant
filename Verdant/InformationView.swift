//
//  InformationView.swift
//  Verdant
//
//  Created by Quintasia Sanders on 2/20/23.
//

import SwiftUI

struct InformationView: View {
    private let colors: [Color] = [.green, .green, .green, .green, .green]
    
    var body: some View {
        VStack {
            TabView {
                ForEach(colors, id: \.self) { color in
                    ZStack {
                        color
                            .ignoresSafeArea()
                        Image ("Image")
                            .frame(width: 5, height: 5)
                        Text ("\(color .description)")
                            .font(.title)
                            .foregroundColor(.white)
                        
                    }
                }
            }
            .tabViewStyle(.page)
            .indexViewStyle(.page(backgroundDisplayMode: .interactive))
            .cornerRadius(30)
            .padding(5)
            Text ("Swipe for More")
                .italic()
        }
    }
    
    struct InformationView_Previews: PreviewProvider {
        static var previews: some View {
            InformationView()
        }
    }
}
