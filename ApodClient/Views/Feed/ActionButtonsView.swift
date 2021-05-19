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
            ApodActionButton(systemName: "star", text: String(likes))
            ApodActionButton(systemName: "text.bubble", text: String(comments))
        }
        .padding(10)
        .background(Color.black.opacity(0.6))
        .cornerRadius(10)
        .transition(.move(edge: .trailing))
    }
}
