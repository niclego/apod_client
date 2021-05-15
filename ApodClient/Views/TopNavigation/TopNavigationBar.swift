//
//  TopNavigationBar.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct TopNavigationBar: View {
    @Binding var showApod: Bool
    
    var body: some View {
        VStack {
            HStack {
                TopNavigationButton(label: "Feed", enabled: showApod) {
                    withAnimation {
                        showApod = true
                    }
                }
                TopNavigationButton(label: "Liked", enabled: !showApod) {
                    withAnimation {
                        showApod = false
                    }
                }
            }
            Spacer()
        }
    }
}
