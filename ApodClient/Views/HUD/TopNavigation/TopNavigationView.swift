//
//  TopNavigationBar.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct TopNavigationView: View {
    @Binding var feedView: Bool

    var body: some View {
        HStack {
            TopNavigationButton(label: "Browse", enabled: !feedView) {
                withAnimation {
                    feedView = false
                }
            }
            
            TopNavigationButton(label: "Feed", enabled: feedView) {
                withAnimation {
                    feedView = true
                }
            }
        }
        .transition(.move(edge: .top))
    }
}
