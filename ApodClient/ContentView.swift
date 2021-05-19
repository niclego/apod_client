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
                FeedView(showExplanation: $showExplanation, showApod: $showApod)
            } else {
                Color.red
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
