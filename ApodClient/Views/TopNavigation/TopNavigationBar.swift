//
//  TopNavigationBar.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct TopNavigationBar: View {
    @Binding var feedView: Bool

    var body: some View {
        HStack {
            TopNavigationButton(label: "Feed", enabled: feedView) {
                withAnimation {
                    feedView = true
                }
            }
            TopNavigationButton(label: "Liked", enabled: !feedView) {
                withAnimation {
                    feedView = false
                }
            }
        }
        .transition(.move(edge: .top))
    }
}
