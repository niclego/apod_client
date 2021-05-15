//
//  ApodDetailsView.swift
//  ApodClient
//
//  Created by Nicolas Le Gorrec on 5/14/21.
//

import SwiftUI

struct DetailsView: View {
    let title: String
    let formatedDate: String
    let copyright: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(formatedDate)
                .font(.title3.weight(.bold))
                .foregroundColor(.white)
                .padding(6)
                .background(Color.black.opacity(0.6))
                .cornerRadius(10)
            Text(title)
                .font(.title.weight(.bold))
                .foregroundColor(.white)
                .padding(6)
                .background(Color.black.opacity(0.6))
                .cornerRadius(10)
            if !copyright.isEmpty {
                Text("© \(copyright)")
                    .foregroundColor(.white.opacity(0.9))
                    .padding(6)
                    .background(Color.black.opacity(0.6))
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}
