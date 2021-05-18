//
//  ContentView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/6/21.
//

import SwiftUI

struct ContentView: View {
    @State var showApod = true
    @State var showExplanation = false

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            if (showApod) {
                FeedView(feedType: "APOD", showExplanation: $showExplanation)
            } else {
                Color.green
//                FeedView(feedType: "Liked", showExplanation: $showExplanation)
            }
            
            TopNavigationBar(showApod: $showApod)
                .blur(radius: showExplanation ? 10 : 0)
                .animation(.linear(duration: 0.4))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
