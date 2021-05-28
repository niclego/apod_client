//
//  TopNavigationButton.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct TopNavigationButton: View {
    let label: String
    let enabled: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(label)
                .foregroundColor(enabled ? .yellow : .white.opacity(0.5))
                .font(.title3.weight(.bold))
        })
        .padding(6)
    }
}
