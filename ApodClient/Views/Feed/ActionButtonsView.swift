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
    let shares: Int
    
    var body: some View {
        VStack {
            ApodActionButton(systemName: "star.fill", text: String(likes))
            ApodActionButton(systemName: "text.bubble.fill", text: String(comments))
//            ApodActionButton(systemName: "arrowshape.turn.up.right.fill", text: String(shares))
        }
        .frame(
            minWidth: 0,
            maxWidth: .infinity,
            alignment: .trailing
        )
        .transition(.move(edge: .trailing))
    }
}
