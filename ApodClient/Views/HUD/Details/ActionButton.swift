//
//  ActionButtonView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct ActionButton: View {
    var systemName: String
    let onPress: () -> Void

    var body: some View {
        Button(action: {
            onPress()
        }) {
            VStack {
                Image(systemName: systemName)
                    .foregroundColor(.white)
                    .font(.title2.weight(.bold))
                    .padding(.bottom, 4)
            }
        }
    }
}
