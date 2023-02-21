//
//  SplashScreen2View.swift
//  Verdant
//
//  Created by Quintasia Sanders on 2/20/23.
//

import SwiftUI

struct SplashScreen2View: View {
    @State private var isActive : Bool = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    
    var body: some View {
        if isActive {
            ContentView ()
        } else {
            VStack {
                VStack {
                    Image ("verdantlogo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 250, height: 250)
                    Text("VERDANT")
                        .font(.largeTitle)
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    withAnimation {
                    self.isActive = true
                }
            }
        }
    }
}
}

    struct SplashScreen2View_Previews: PreviewProvider {
        static var previews: some View {
            SplashScreen2View()
    }
}
