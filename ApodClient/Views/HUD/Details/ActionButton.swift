//
//  ActionButtonView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct ApodActionButton: View {
    var systemName: String
    var text: String
    
    var body: some View {
        Button(action: {
            print("hello")
        }) {
            VStack {
                Image(systemName: systemName)
                    .foregroundColor(.white)
                    .font(.title3)
                    .padding(.bottom, 7)
            }
        }
    }
}
