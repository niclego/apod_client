//
//  ContentView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/6/21.
//

import SwiftUI

struct ContentView: View {
    @State var showApod = true

    var body: some View {
        ZStack {
            if (showApod) {
                FeedView(feedType: "APOD")
            } else {
                FeedView(feedType: "Liked")
            }
            
            TopNavigationBar(showApod: $showApod)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
