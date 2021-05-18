//
//  ActionButtonsView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct ActionButtonsView: View {
    let likes: Int
    let comments: Int
    
    var body: some View {
        VStack {
            VStack {
                ApodActionButton(systemName: "star.fill", text: String(likes))
                ApodActionButton(systemName: "text.bubble.fill", text: String(comments))
            }
            .background(Color.gray.opacity(0.1))
            .cornerRadius(10)
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            alignment: .trailing
        )
        .transition(.move(edge: .trailing))
    }
}
